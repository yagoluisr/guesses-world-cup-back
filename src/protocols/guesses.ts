export type GuessEntity = {
    id: number,
    user_id: number,
    match_id: number,
    score_s1: number,
    score_s2: number,
}

export type Guess = Omit<GuessEntity, 'id'>

export type NewGuess = Partial<GuessEntity>