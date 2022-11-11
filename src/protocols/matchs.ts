export type MatchEntity = {
    id: number,
    selection_s1: number,
    selection_s2: number,
    scoreboard_id: number,
    winner: string,
    tied: boolean,
    guesses_status: boolean,
    date: Date
}

export type UpdateMatch = Omit<MatchEntity, 'selection_s1' | 'selection_s2' | 'scoreboard_id' | 'winner' | 'tied' | 'date'>;

export type Match = Partial<MatchEntity>;