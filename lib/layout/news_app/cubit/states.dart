abstract class newsStates {}

class newsInitialStates extends newsStates {}

class newsBottomNavStates extends newsStates {}

class newsGetBusinessLoadingState extends newsStates{}

class newsGetBusinessSuccessState extends newsStates{}
class newsSelectedItemState extends newsStates{}


class newsGetBusinessErrorState extends newsStates
{
  final String error;

  newsGetBusinessErrorState(this.error);

}

class newsGetSportsLoadingState extends newsStates{}

class newsGetSportsSuccessState extends newsStates{}

class newsGetSportsErrorState extends newsStates
{
  final String error;

  newsGetSportsErrorState(this.error);

}

class newsGetScienceLoadingState extends newsStates{}

class newsGetScienceSuccessState extends newsStates{}

class newsGetScienceErrorState extends newsStates
{
  final String error;

  newsGetScienceErrorState(this.error);

}

class newsGetSearchLoadingState extends newsStates{}

class newsGetSearchSuccessState extends newsStates{}

class newsGetSearchErrorState extends newsStates
{
  final String error;

  newsGetSearchErrorState(this.error);

}

