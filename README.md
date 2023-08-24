# ososs_test

## dependencies

- **bloc** used for state management
- **flutter_bloc** used for state management
- **dio** used to send http request to the [PokéApi](https://pokeapi.co/)

## pokemons image

we have two ways for get the image:

1- send http request for each item to `https://pokeapi.co/api/v2/pokemon/{name}` endpoint to get the image url from `sprites->front_default` value and this way has big network usage and takes long time to load

2- use the url template for the images `https://raw.githubusercontent.com/PokeAPI/sprites/master/sprites/pokemon/{id}.png`
where id is the index of the pokemon +1 but this way has problem id of pokemon from 1010 has another format so I had to re-format.

### example

```{
  "count": 1281,
  "next": "https://pokeapi.co/api/v2/pokemon?offset=1012&limit=4",
  "previous": "https://pokeapi.co/api/v2/pokemon?offset=1004&limit=4",
  "results": [
    {
      "name": "walking-wake",
      "url": "https://pokeapi.co/api/v2/pokemon/1009/"
    },
    {
      "name": "iron-leaves",
      "url": "https://pokeapi.co/api/v2/pokemon/1010/"
    },
    {
      "name": "deoxys-attack",
      "url": "https://pokeapi.co/api/v2/pokemon/10001/"
    },
    {
      "name": "deoxys-defense",
      "url": "https://pokeapi.co/api/v2/pokemon/10002/"
    }
  ]
}
```
