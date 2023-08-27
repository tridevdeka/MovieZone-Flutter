import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:tmdb_movies_flutter/common/constants/size_constants.dart';
import 'package:tmdb_movies_flutter/common/extensions/size_extensions.dart';
import 'package:tmdb_movies_flutter/data/core/api_constants.dart';
import 'package:tmdb_movies_flutter/presentation/blocs/cast_bloc/cast_bloc.dart';
import 'package:tmdb_movies_flutter/presentation/themes/theme_text.dart';

class CastWidget extends StatelessWidget {
  const CastWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<CastBloc, CastState>(builder: (context, state) {
      if (state is CastLoadedState) {
        return SizedBox(
          height: Sizes.dimen_100.h,
          child: ListView.builder(
            scrollDirection: Axis.horizontal,
            shrinkWrap: true,
            itemCount: state.castList.length,
            itemBuilder: (context, index) {
              final castEntity = state.castList[index];
              return SizedBox(
                height: Sizes.dimen_100.h,
                width: Sizes.dimen_180.w,
                child: Card(
                  elevation: 1,
                  margin: EdgeInsets.symmetric(
                    horizontal: Sizes.dimen_8.w,
                    vertical: Sizes.dimen_4.h,
                  ),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.all(Radius.circular(Sizes.dimen_8.w)),
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Expanded(
                        child: ClipRRect(
                          borderRadius: BorderRadius.vertical(top: Radius.circular(Sizes.dimen_8.w)),
                          child: CachedNetworkImage(
                            height: Sizes.dimen_100.h,
                            width: Sizes.dimen_180.w,
                            imageUrl: '${ApiConstants.BASE_URL_IMAGE}${castEntity.profilePath}',
                            fit: BoxFit.cover,
                          ),
                        ),
                      ),
                      Padding(
                        padding: EdgeInsets.symmetric(horizontal: Sizes.dimen_8.w),
                        child: Text(
                          castEntity.name!,
                          maxLines: 1,
                          overflow: TextOverflow.fade,
                          style: Theme.of(context).textTheme.vulcanBodyText2,
                        ),
                      ),
                      Padding(
                        padding: EdgeInsets.only(
                          left: Sizes.dimen_8.w,
                          right: Sizes.dimen_8.w,
                          bottom: Sizes.dimen_2.h,
                        ),
                        child: Text(
                          castEntity.character!,
                          maxLines: 1,
                          overflow: TextOverflow.ellipsis,
                          style: Theme.of(context).textTheme.bodySmall,
                        ),
                      ),
                    ],
                  ),
                ),
              );
            },
          ),
        );
      } else {
        return SizedBox.shrink();
      }
    });
  }
}
