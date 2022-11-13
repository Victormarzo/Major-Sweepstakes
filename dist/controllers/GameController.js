function getGameList(req, res) {
    var gameList = [
        {
            "Title": "Furia X NAVI",
            "TeamOnePick": "Nuke",
            "TeamTwoPick": "Vertigo",
            "Decider": "Inferno"
        },
        {
            "Title": "C9 X MOUZ",
            "TeamOnePick": "Inferno",
            "TeamTwoPick": "Vertigo",
            "Decider": "Dust 2"
        }
    ];
    res.send(gameList);
}
export { getGameList };
