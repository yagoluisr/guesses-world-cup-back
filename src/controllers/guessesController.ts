import { Request, Response } from "express";
import { GuessEntity } from "../protocols/guesses.js";
import { allGuesses, insertGuessById } from "../repositories/guessesRepository.js";
import { guessSchema } from "../schemas/userSchema.js";

export async function getGuesses (req: Request, res: Response) {

    try {
        const result = await allGuesses();

        res.send(result.rows)
    } catch (error) {
        res.status(500).send(error.message)
    }

}

export async function insertGuess (req: Request, res: Response) {
    const guess = req.body as GuessEntity;

    const { error } = guessSchema.validate(guess);

    if(error) {
        return res.status(400).send({message: error.message});
    }

    try {
        const result = await insertGuessById(guess);

        res.status(200).send('Ok');
    } catch (error) {
        res.status(500).send(error.message)
    }
}