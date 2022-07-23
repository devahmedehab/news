import 'package:conditional_builder/conditional_builder.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:news/layout/news_app/cubit/cubit.dart';
import 'package:news/layout/news_app/cubit/states.dart';
import 'package:news/shared/components/components.dart';
import 'package:news/shared/cubit/cubit.dart';
import 'package:responsive_builder/responsive_builder.dart';

class BusinessScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return BlocConsumer<newsCubit, newsStates>(
      listener: (context, state) {},
      builder: (context, state)
      {
        var list = newsCubit.get(context).business;

        return ScreenTypeLayout(
          mobile: articleBuilder(list, context),
          desktop: Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Expanded(
                child: articleBuilder(list, context),
              ),
              if(list.length >0)
              Expanded(
                  child: Padding(
                    padding: const EdgeInsets.all(20.0),
                    child: Text(
                      '${list[newsCubit.get(context).selectedBusinessItem]['description']}',
                      style: TextStyle(fontSize: 20.0),
                    ),
                  ),
              ),

            ],
          ),
            breakpoints: ScreenBreakpoints(
              desktop:700,tablet:600 ,watch:100 ,
            )
        );
      },
    );
  }
}