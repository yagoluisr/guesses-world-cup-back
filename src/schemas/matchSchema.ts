import Joi from "joi";

export const UpdateMatchSchema = Joi.object({
    id: Joi.number().required(),
    guesses_status: Joi.boolean().required()
});