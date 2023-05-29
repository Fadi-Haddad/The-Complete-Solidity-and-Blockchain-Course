// Mapping Assignment:

// 0. Create a unique data type as a struct called movie and give it the string properties: title and director. 
// 1. Create a map called movie wich takes a uint as a key and Movie as a value 
// 2, create a function called addMovie which takes three inputs, movie id, title and director which 
//    assigns a value of an integer to a movie added back to the movie map. It should include a title and director name,
// 3. Deploy the contract and update the movie interaction to the movie mop with our Favorite movies.

pragma solidity = 0.5.0;

contract MovieContract {

mapping (uint => Movie) movie;

mapping (uint => mapping(uin => Movie)) public myMovie;

struct Movie {
    string title;
    string director;
}
function addMovie(uint id, string memory title, string memory director) public {
    movie[id] = Movie (title, director);
}
function addMyMovie(uint id, string memory title, string memory director) public {
    myMovie[msg.sender][id] = Movie (title, director);     //msg.sender is used to capture the address of the sender
}

}