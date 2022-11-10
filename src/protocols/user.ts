export type RegisterUserEntity = {
    id: number,
    name: string,
    email: string
}

export type RegisterUserProtocol = Omit<RegisterUserEntity, 'id'>