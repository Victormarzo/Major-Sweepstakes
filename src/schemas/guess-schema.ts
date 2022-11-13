import Joi from 'joi';
export const newGuessSchema= Joi.object({
    matchId:Joi.number().required(),
    guess:Joi.string().required(),
    name:Joi.string().required(),
})
