import { Request, Response } from "express";
import { allGuesses } from "../repositories/guessesRepository.js";

export async function getGuesses (req: Request, res: Response) {

    try {
        const result = await allGuesses();

        res.send(result.rows)
    } catch (error) {
        res.status(500).send(error.message)
    }

}