import { Request, Response } from "express";
import { Guess, GuessDelete, GuessEntity, GuessUpdate, NewGuess } from "../protocols/guesses.js";
import { allGuesses, checkUser, deleteGuessById, getGuessById, guessesStatus, hasGuess, insertGuessById, updateGuessById } from "../repositories/guessesRepository.js";
import { GuessDeleteSchema, guessSchema, GuessUpdateSchema } from "../schemas/guessSchema.js";

export async function getGuesses (req: Request, res: Response) {

    try {
        const result = await allGuesses();

        res.send(result.rows)
    } catch (error) {
        res.status(500).send(error.message)
    }
}

export async function getGuessesById(req: Request, res: Response) {
    const user_id = req.params as NewGuess;

    try {
        const result = await getGuessById(user_id)
        
        res.send(result.rows)
    } catch (error) {
        res.status(500).send(error.message)
    }
}

export async function insertGuess (req: Request, res: Response) {
    const userGuess = req.body as Guess;

    const { error } = guessSchema.validate(userGuess,{abortEarly: false});

    if(error) {
        const message = error.details.map(obj => obj.message)
        return res.status(400).send(message);
    }

    try {
        const hasUser = await checkUser(userGuess);
        if(hasUser.rows.length === 0) return res.sendStatus(400);

        const statusGuess = await guessesStatus(userGuess);
        if(statusGuess.rows[0].guesses_status === false) return res.status(401).send('This match has been finish for guesses !')

        const result = await hasGuess(userGuess);
        if(result.rows.length > 0) return res.status(400).send('Do you already have a guess for this match !');

        await insertGuessById(userGuess);

        res.status(201).send('Ok');
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
        
        res.send('Ok');
    } catch (error) {
        res.status(500).send(error.message)
    }
}

export async function deleteGuess(req: Request, res: Response) {
    const delGuess = req.body as GuessDelete;

    const { error } = GuessDeleteSchema.validate(delGuess, {abortEarly: false});

    if(error) {
        const message = error.details.map(obj => obj.message)
        return res.status(400).send(message);
    }

    try {
        await deleteGuessById(delGuess);

        res.send('Ok');
    } catch (error) {
        res.status(500).send(error.message)
    }
}