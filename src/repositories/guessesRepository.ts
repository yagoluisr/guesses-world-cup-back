import { QueryResult } from "pg";
import connection from "../database/db.js";
import { Guess, GuessEntity } from "../protocols/guesses.js";


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