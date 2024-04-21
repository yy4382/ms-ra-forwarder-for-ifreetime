import { Request, Response } from "express";
function generateRandomString(length: number): string {
    const characters =
        "ABCDEFGHIJKLMNOPQRSTUVWXYZabcdefghijklmnopqrstuvwxyz0123456789";
    let result = "";
    const charactersLength = characters.length;
    for (let i = 0; i < length; i++) {
        result += characters.charAt(
            Math.floor(Math.random() * charactersLength)
        );
    }
    return result;
}

module.exports = async (request: Request, response: Response) => {
    console.log("Import url: " + request.url);
    const api = request.query["api"];
    const name = request.query["name"];
    const voiceName = request.query["voiceName"] ?? "zh-CN-XiaoxiaoNeural";
    const token = request.query["token"] ?? "";

    const config = {
        loginUrl: "",
        _ClassName: "JxdAdvCustomTTS",
        _TTSConfigID: generateRandomString(16),
        httpConfigs: {
            headers: {},
        },
        ttsHandles: [
            {
                forGetMethod: 1,
                processType: 1,
                params: {
                    text: "%@",
                    voiceName: voiceName,
                },
                url: api,
                parser: {
                    playData: "ResponseData",
                },
                httpConfigs: {
                    useCookies: 1,
                    headers: {
                        authorization: `Bearer ${token}`,
                    },
                },
            },
        ],
        _TTSName: name,
    };
    response.status(200).json(config);
};
