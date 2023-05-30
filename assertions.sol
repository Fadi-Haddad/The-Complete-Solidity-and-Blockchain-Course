pragma solidity >= 0.5.0 < 0.7.0 ;

contract TestAssertions {

function test() public {
    assert (1 days == 24 hours);

    assert (1 hours == 60 minutes);
    
    assert (1 minutes == 60 seconds);

    assert (1 hours == 3600 seconds);

    assert (1 ether == 1e18 wei);

    assert (1 ether == 1000000000000000000 wei);
    
    assert ( 1 wei == 1);

}
}