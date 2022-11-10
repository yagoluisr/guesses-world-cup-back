export type GuessEntity = {
    id: number,
    user_id: number,
    match_id: number,
    score_s1: number,
    score_s2: number,
}

export type Guess = Omit<GuessEntity, 'id'>

export type NewGuess = Partial<GuessEntity>

export type GuessUpdate = {
    guess_id: number,
    score_s1: number,
    score_s2: number
}

export type GuessDelete = {
    user_id: number,
    guess_id: number
}