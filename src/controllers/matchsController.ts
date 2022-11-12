import { Request, Response } from "express";
import { EndGame, UpdateMatch } from "../protocols/matchs.js";
import { alterGuessesStatus, checkMatch, finishMatch } from "../repositories/matchRepository.js";
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
        if(hasMatch.rows[0].guesses_status === true) return res.status(400).send("This game can't be finished yet");

        await finishMatch(match);

        res.send()
    } catch (error) {
        res.status(500).send(error.message)
    }
}