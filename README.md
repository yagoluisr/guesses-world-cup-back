
# Guesses world cup 2022

This project is a back-end API, was made for fans of world cup 2022. 
The users can guesses about match of world cup and choose the scoreboard of game.
The user can spy the guess your friend and all users.



## Stack utilizada


**Back-end:** Node, Express, Typescript


## API documentation

#### Register user

```http
  POST /register
```

| Params   | type       | Description                           |
| :---------- | :--------- | :---------------------------------- |
| `name` | `string` | username |
| `email` | `string` | user email |

* All parameters are required.
##### Return status code 200 

    { 
        "id": 1, 
        "name": "Yago",
        "email": "yago@email.com" 
    }


#### Return all matchs

```http
  GET /matchs
```

| Params   | type       | Description                           |
| :---------- | :--------- | :---------------------------------- |
| `id` | `number` | identificator  |
| `selection_1` | `number` | selection identificator |
| `selection_2` | `number` | selection identificator |
| `scoreboard_id` | `number` | scoreboard identificator |
| `winner` | `text` | name of the winner selection or "tie" |
| `tied` | `boolean` | "true" if tied otherwise "false" |
| `guesses_status` | `boolean` | "true" if open to guessing otherwise "false" |
| `date` | `date` | date of the match |

##### Return status code 200 

    [
        {
            "id": 14,
            "selection_1": 5,
            "selection_2": 6,
            "scoreboard_id": 3,
            "winner": null,
            "tied": false,
            "guesses_status": true,
            "date": "2022-11-21T03:00:00.000Z"
        }
    ]


#### Return all guesses

```http
  GET /guesses
```

| Params   | type       | Description                           |
| :---------- | :--------- | :---------------------------------- |
| `id` | `number` | identificator  |
| `user_id` | `number` | user identificator |
| `match_id` | `number` | match identificator |
| `score_s1` | `number` | number of goals of the selection 1 |
| `score_s2` | `number` | number of goals of the selection 2 |

##### Return status code 200 

    [
        {
        "id": 5,
        "user_id": 1,
        "match_id": 13,
        "score_s1": 2,
        "score_s2": 1
        },
        {
        "id": 6,
        "user_id": 1,
        "match_id": 14,
        "score_s1": 3,
        "score_s2": 4
        }
    ]


#### Enter a guess

```http
  POST /guesses
```

| Params   | type       | Description                           |
| :---------- | :--------- | :---------------------------------- |
| `user_id` | `number` | user identificator |
| `match_id` | `number` | match identificator |
| `score_s1` | `number` | number of goals of the selection 1 |
| `score_s2` | `number` | number of goals of the selection 2 |

##### Return status code 201 


#### Update a guess

```http
  PUT /guesses
```

| Params   | type       | Description                           |
| :---------- | :--------- | :---------------------------------- |
| `guess_id` | `number` | guess identificator |
| `score_s1` | `number` | number of goals of the selection 1 |
| `score_s2` | `number` | number of goals of the selection 2 |

##### Return status code 200 


#### Delete a guess

```http
  DELETE /guesses
```

| Params   | type       | Description                           |
| :---------- | :--------- | :---------------------------------- |
| `user_id` | `number` | user identificator |
| `guess_id` | `number` | guess identificator |

##### Return status code 200 
## Installation

1. Git clone in that repository 
(https://docs.github.com/pt/repositories/creating-and-managing-repositories/cloning-a-repository)

2. Install depencencies inside guesses-world-cup-back folder
    
    `npm i`
    
3. Create a local postgres database with name "guesses" using the dump.sql file.
4. Create an `.env` file according to the `.env.example`.
5. Start the application in the project root
    
    `npm run dev`


    