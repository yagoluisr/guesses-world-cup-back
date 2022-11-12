import { Request, Response } from "express";
import { EndGame, UpdateMatch } from "../protocols/matchs.js";
import { alterGuessesStatus, checkMatch, finishMatch, finishScoreboard } from "../repositories/matchRepository.js";
import { UpdateMatchSchema } from "../schemas/matchSchema.js";

export async function updateGuessesStatus(req: Request, res: Response) {
    const matchId = req.body as UpdateMatch;

    const { error } = UpdateMatchSchema.validate(matchId,{abortEarly: false});

    if(error) {
        const message = error.details.map(obj => obj.message);
        return res.status(400).send(message);
    }

    try {
        const result = await alterGuessesStatus(matchId);

        res.send('Ok');
    } catch (error) {
        res.status(500).send(error.message)
    }
}

export async function endGame(req: Request, res: Response) {
    const match = req.body as EndGame;

    try {
        const hasMatch = await checkMatch(match);

        if(!hasMatch) return res.status(400).send('Match not found');
        if(hasMatch.rows[0]?.guesses_status === true) return res.status(400).send("This game can't be finished yet");

        await finishMatch(match);
        await finishScoreboard({...match, scoreboard_id: hasMatch.rows[0].scoreboard_id});

        res.send('oi !')
    } catch (error) {
        res.status(500).send(error)
    }
}