import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:nuconta_marketplace/domain/entities/offer_entity.dart';
import 'package:nuconta_marketplace/ui/pages/home/cubit/home_cubit.dart';
import 'package:nuconta_marketplace/ui/utils/utils.dart';

class HomePage extends StatefulWidget {
  const HomePage({
    Key? key,
  }) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  void initState() {
    super.initState();
    BlocProvider.of<HomeCubit>(context).getData();
  }

  @override
  Widget build(BuildContext context) {
    final cubit = BlocProvider.of<HomeCubit>(context);
    final theme = Theme.of(context);

    return BlocBuilder<HomeCubit, HomeState>(
      builder: (context, state) {
        if (state.status == HomeStatus.loading) {
          return const Material(
            child: Center(
              child: CircularProgressIndicator(),
            ),
          );
        }

        if (state.status == HomeStatus.error) {
          return Material(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const Text(StringConstants.errorWhenFetchingData),
                ElevatedButton(
                  onPressed: cubit.getData,
                  child: const Text(StringConstants.tryAgain),
                ),
              ],
            ),
          );
        }

        return Scaffold(
          appBar: AppBar(
            title: Text(
              '${StringConstants.hello}, ${state.customerEntity?.name}',
            ),
          ),
          body: ListView(
            padding: const EdgeInsets.all(NumbersConstants.kComponentSpacer16),
            children: [
              Text(
                StringConstants.balance,
                style: theme.textTheme.headline6,
              ),
              const SizedBox(height: NumbersConstants.kComponentSpacer16),
              Text(
                '${state.customerEntity?.balance?.toDouble().toCurrency}',
                style: theme.textTheme.headline5?.copyWith(
                  fontWeight: FontWeight.w700,
                ),
              ),
              const SizedBox(height: NumbersConstants.kComponentSpacer16),
              const Divider(),
              Text(
                StringConstants.offers,
                style: theme.textTheme.headline6,
              ),
              const SizedBox(height: NumbersConstants.kComponentSpacer16),
              ListView.separated(
                separatorBuilder: (_, index) => const Divider(),
                physics: const NeverScrollableScrollPhysics(),
                shrinkWrap: true,
                itemCount: state.customerEntity?.offers?.length ??
                    NumbersConstants.kZero,
                itemBuilder: (context, index) {
                  final offer = state.customerEntity?.offers?[index];

                  return _OfferTile(
                    offer: offer,
                  );
                },
              )
            ],
          ),
        );
      },
    );
  }
}

class _OfferTile extends StatelessWidget {
  const _OfferTile({
    Key? key,
    required this.offer,
  }) : super(key: key);

  final OfferEntity? offer;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return InkWell(
      onTap: () {},
      child: Row(
        children: [
          Container(
            width: NumbersConstants.containerImageHomeHeight,
            padding: const EdgeInsets.only(
              right: NumbersConstants.kComponentSpacer16,
            ),
            child: Image.network(
              '${offer?.product?.image}',
              fit: BoxFit.cover,
              height: NumbersConstants.imageHomeHeight,
            ),
          ),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                '${offer?.product?.name}',
                textAlign: TextAlign.center,
              ),
              Text(
                '${offer?.price?.toDouble().toCurrency}',
                style: theme.textTheme.headline6?.copyWith(
                  fontWeight: FontWeight.w700,
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
