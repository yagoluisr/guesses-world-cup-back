import { Request, Response } from "express";
import { UpdateMatch } from "../protocols/matchs.js";
import { alterGuessesStatus } from "../repositories/matchRepository.js";
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