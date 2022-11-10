import { QueryResult } from "pg";
import connection from "../database/db.js";
import { Guess, GuessEntity, GuessUpdate } from "../protocols/guesses.js";


export async function allGuesses(): Promise<QueryResult<GuessEntity>> {

    return connection.query(
        `SELECT * FROM guesses;`
    )
}

export async function insertGuessById(guess: Guess): Promise<QueryResult<GuessEntity>> {
    
    return connection.query(
        `INSERT INTO guesses (user_id, match_id, score_s1, score_s2) VALUES ($1,$2,$3,$4);`,
        [guess.user_id, guess.match_id, guess.score_s1, guess.score_s2]
    )
}

export async function updateGuessById(guessUpdateById: GuessUpdate): Promise<QueryResult> {

    return connection.query(
        `UPDATE 
            guesses
        SET
            score_s1 = $1, 
            score_s2 = $2
        WHERE
            id = $3`
        ,[guessUpdateById.score_s1, guessUpdateById.score_s2, guessUpdateById.guess_id]
    )
}