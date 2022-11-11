import { QueryResult } from "pg";
import connection from "../database/db.js";
import { Guess, GuessDelete, GuessEntity, GuessUpdate, NewGuess } from "../protocols/guesses.js";
import { RegisterUserEntity } from "../protocols/user.js";


export async function allGuesses(): Promise<QueryResult<GuessEntity>> {

    return connection.query(
        `SELECT * FROM guesses;`
    );
}

export async function getGuessById(user_id: NewGuess): Promise<QueryResult<GuessEntity[]>> {

    return connection.query(
        `SELECT *
        FROM
            guesses
        WHERE
            user_id = $1`
        ,[user_id.id]
    );
}

export async function insertGuessById(guess: Guess): Promise<QueryResult<GuessEntity>> {
    
    return connection.query(
        `INSERT INTO 
            guesses (
                user_id, match_id, 
                score_s1,
                score_s2
            ) 
        VALUES ($1,$2,$3,$4);`,
        [guess.user_id, guess.match_id, guess.score_s1, guess.score_s2]
    );
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
    );
}

export async function deleteGuessById (delGuess: GuessDelete): Promise<QueryResult> {

    return connection.query(
        `DELETE FROM
            guesses
        WHERE 
            id = $1 AND
            user_id = $2`
        ,[delGuess.guess_id, delGuess.user_id]
    );
}