import { Request, Response } from "express";
import { GuessEntity, GuessUpdate } from "../protocols/guesses.js";
import { allGuesses, insertGuessById, updateGuessById } from "../repositories/guessesRepository.js";
import { guessSchema, GuessUpdateSchema } from "../schemas/guessSchema.js";

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
        await insertGuessById(guess);

        res.status(200).send('Ok');
    } catch (error) {
        res.status(500).send(error.message)
    }
}

export async function updateGuess(req: Request, res: Response) {
    const guessUpdateById = req.body as GuessUpdate;

    const { error } = GuessUpdateSchema.validate(guessUpdateById,{abortEarly: false});

    if(error) {
        const message = error.details.map(obj => obj.message)
        return res.status(400).send(message);
    }

    try {
        await updateGuessById(guessUpdateById);
        
        res.send('Ok')
    } catch (error) {
        res.status(500).send(error.message)
    }
}