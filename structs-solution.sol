pragma solidity >= 0.7.0 < 0.9.0;

// 1. create a new movie and set it up so that it updates to the movie in the setMovie function
// 2. return the id of the new movie
// 3. create a new var called comedy and set up comedy to the datatype Movie 
//4. update the setMovie function with a comedy movie that contain name, director, and an id
//5. return the movie id of the comedy. 

contract learnStructs {
    
 struct Movie {

     string title;
     string director;
     uint movie_id;
 }

    Movie movie;
    Movie comedy;
    

    function setMovie() public {
       comedy = Movie('the mask', 'Jim Carrey', 4);
    }

    function getMovieId() public view returns(uint) {
        return comedy.movie_id;
    }

}

// 1. create a new movie and set it up so that it updates to the movie in the setMovie function
// 2. return the id of the new movie
// 3. create a new var called comedy and set up comedy to the datatype Movie 
//4. update the setMovie function with a comedy movie that contain name, director, and an id
//5. return the movie id of the comedy. 