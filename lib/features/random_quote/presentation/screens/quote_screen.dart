import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:quotes/config/locale/app_localizations.dart';
import 'package:quotes/core/utils/app_colors.dart';
import 'package:quotes/core/utils/app_strings.dart';
import 'package:quotes/core/widgets/error_widget.dart';
import 'package:quotes/features/random_quote/presentation/cubits/random_quote_cubit.dart';
import 'package:quotes/features/random_quote/presentation/cubits/random_quote_state.dart';
import 'package:quotes/features/random_quote/presentation/widgets/quote_content.dart';
import 'package:quotes/features/splash/presentation/cubit/locale_cubit.dart';

class QuoteScreen extends StatefulWidget {
  const QuoteScreen({super.key});

  @override
  State<QuoteScreen> createState() => _QuoteScreenState();
}

class _QuoteScreenState extends State<QuoteScreen> {
  _getRandomQuote() =>
      BlocProvider.of<RandomQuoteCubit>(context).getRandomQuote();

  @override
  void initState() {
    super.initState();
    _getRandomQuote();
  }

  Widget _buildBodyContent() {
    return BlocBuilder<RandomQuoteCubit, RandomQuoteState>(
        builder: ((context, state) {
      if (state is RandomQuoteIsLoading) {
        return Center(
          child: SpinKitFadingCircle(
            color: AppColors.primary,
          ),
        );
      } else if (state is RandomQuoteError) {
        return CustomErrorWidget(onPress: () => _getRandomQuote);
      } else if (state is RandomQuoteLoaded) {
        return Column(
          children: [
            /*            Text(
                'Quotes',
                style: Theme.of(context).textTheme.bodyMedium!.copyWith(
                      color: AppColors.black,
                    ),
              ), */
            QuoteContent(quote: state.quote),
            IconButton(
              onPressed: () => _getRandomQuote(),
              icon: Icon(
                Icons.refresh,
                color: AppColors.white,
              ),
              style: ButtonStyle(
                backgroundColor: MaterialStateProperty.all(AppColors.primary),
              ),
            ),
          ],
        );
      } else {
        return Center(
          child: SpinKitFadingCircle(
            color: AppColors.primary,
          ),
        );
      }
    }));
  }

  @override
  Widget build(BuildContext context) {
    final appBar = AppBar(
      title: const Text(AppStrings.appName),
      leading: IconButton(
        onPressed: () {
          if (AppLocalizations.of(context)!.isEnLocale) {
            BlocProvider.of<LocaleCubit>(context).toArabic();
          } else {
            BlocProvider.of<LocaleCubit>(context).toEnglish();
          }
        },
        icon: Icon(
          Icons.translate_outlined,
          color: AppColors.primary,
        ),
      ),
    );
    return RefreshIndicator(
      onRefresh: () => _getRandomQuote(),
      child: Scaffold(
        appBar: appBar,
        body: _buildBodyContent(),
      ),
    );
  }
}
