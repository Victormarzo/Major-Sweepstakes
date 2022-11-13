import Joi from 'joi';
export const newGameSchema= Joi.object({
    firstTeamId:Joi.number().required(),
    secondTeamId:Joi.number().required(),
    mapId:Joi.number().required(),
})

