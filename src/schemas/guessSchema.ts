import Joi from 'joi';

export const guessSchema = Joi.object({
    user_id: Joi.number().required(),
    match_id: Joi.number().required(),
    score_s1: Joi.number().required(),
    score_s2: Joi.number().required()
});

export const GuessUpdateSchema = Joi.object({
    guess_id: Joi.number().required(),
    score_s1: Joi.number().required(),
    score_s2: Joi.number().required()
});

export const GuessDeleteSchema = Joi.object({
    user_id: Joi.number().required(),
    guess_id: Joi.number().required()
})