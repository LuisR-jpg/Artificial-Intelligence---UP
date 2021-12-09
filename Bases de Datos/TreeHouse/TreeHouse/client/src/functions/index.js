import * as api from  "../api/index.js"
export const sendEvent = async({nombre, correo, nPersonas, fecha}) => {
    try {
        const {data} = await api.sendEvent({nombre, correo, nPersonas, fecha});
        return data;
    }
    catch (error) {
        console.log(error)
    }
}
