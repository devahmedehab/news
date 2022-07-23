import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:news/layout/news_app/cubit/states.dart';
import 'package:news/modules/business/business_screen.dart';
import 'package:news/modules/science/science_screen.dart';
import 'package:news/modules/settings_screen/settings_screen.dart';
import 'package:news/modules/sports/sports_screen.dart';
import 'package:news/shared/network/remote/dio_helper.dart';


class newsCubit extends Cubit<newsStates>
{
  newsCubit() : super(newsInitialStates());

  static newsCubit get(context) => BlocProvider.of(context);

  int currentIndex = 0;

  List<BottomNavigationBarItem> bottomItems =
  [
    BottomNavigationBarItem(
      icon: Icon(
        Icons.business,
      ),
      label: 'Business',
    ),
    BottomNavigationBarItem(
      icon: Icon(
        Icons.sports,
      ),
      label: 'Sports',
    ),
    BottomNavigationBarItem(
      icon: Icon(
        Icons.science,
      ),
      label: 'Science',
    ),

  ];

  List<Widget> screens =[
    BusinessScreen(),
    SportsScreen(),
    ScienceScreen(),

  ];


  void changeBottomNavBar(int index)
  {
    currentIndex= index;
    if(index==1)
      getSports();
    if (index==2)
      getScience();

    emit(newsBottomNavStates());
  }
  List< dynamic> business =[];
 // List< bool> businessSelectedItem =[];
  int selectedBusinessItem=0 ;

  void selectBusinessItem(index){
  /* for(int i=0 ; i<businessSelectedItem.length ; i++){
     if(i ==  index)
       businessSelectedItem[i]= true;
     else
       businessSelectedItem[i]= false;

   }*/
    selectedBusinessItem =index;
    emit(newsSelectedItemState());
  }


  void getBusiness()
  {

    emit(newsGetSportsLoadingState());
    DioHelper.getData(
      url: 'v2/top-headlines',
      query:
      {
        'country':'eg',
        'category':'business',
        'apiKey':'88c9fb6c24d64fa9bc2a32a67abfb36c',
      },
    ).then((value)
    {
      //print(value.data['articles'][0]['title']);
      business = value.data['articles'];
     /* business.forEach((element)
      {
        businessSelectedItem.add(false);
      }
      );*/
      print(business[0]['title']);

      emit(newsGetBusinessSuccessState());
    }).catchError((error){
      print(error.toString());
      emit(newsGetBusinessErrorState(error.toString()));
    });
  }
  List< dynamic> sports =[];

  void getSports()
  {
    emit(newsGetSportsLoadingState());
    if(sports.length ==0){

      DioHelper.getData(
        url: 'v2/top-headlines',
        query:
        {
          'country':'eg',
          'category':'sports',
          'apiKey':'88c9fb6c24d64fa9bc2a32a67abfb36c',
        },
      ).then((value)
      {
        //print(value.data['articles'][0]['title']);
        sports = value.data['articles'];
        print(sports[0]['title']);

        emit(newsGetSportsSuccessState());
      }).catchError((error){
        print(error.toString());
        emit(newsGetSportsErrorState(error.toString()));
      });
    }else
    {
      emit(newsGetSportsSuccessState());
    }
  }

  List< dynamic> science =[];

  void getScience()
  {
    emit(newsGetSportsLoadingState());
    if(science.length ==0)
    {
      DioHelper.getData(
        url: 'v2/top-headlines',
        query:
        {
          'country':'eg',
          'category':'science',
          'apiKey':'88c9fb6c24d64fa9bc2a32a67abfb36c',
        },
      ).then((value)
      {
        //print(value.data['articles'][0]['title']);
        science = value.data['articles'];
        print(science[0]['title']);

        emit(newsGetScienceSuccessState());
      }).catchError((error){
        print(error.toString());
        emit(newsGetScienceErrorState(error.toString()));
      });

    }else{
      emit(newsGetScienceSuccessState());
    }


  }

  List< dynamic> search =[];

  void getSearch(String value)
  {
    emit(newsGetSearchLoadingState());
    search = [];
    DioHelper.getData(
      url: 'v2/everything',
      query:
      {
        'q':'$value',
        'apiKey':'88c9fb6c24d64fa9bc2a32a67abfb36c',
      },
    ).then((value)
    {
      //print(value.data['articles'][0]['title']);
      search = value.data['articles'];
      print(search[0]['title']);

      emit(newsGetSearchSuccessState());
    }).catchError((error){
      print(error.toString());
      emit(newsGetSearchErrorState(error.toString()));
    });


  }

}