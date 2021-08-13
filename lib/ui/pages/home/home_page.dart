import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:nuconta_marketplace/domain/entities/customer_entity.dart';
import 'package:nuconta_marketplace/domain/entities/entities.dart';
import 'package:nuconta_marketplace/ui/pages/home/components/components.dart';
import 'package:nuconta_marketplace/ui/pages/home/cubit/home_cubit.dart';
import 'package:nuconta_marketplace/ui/utils/utils.dart';

class HomePage extends StatelessWidget {
  const HomePage({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final cubit = BlocProvider.of<HomeCubit>(context);

    return BlocBuilder<HomeCubit, HomeState>(
      buildWhen: (previous, current) => previous.status != current.status,
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

        return _HomePage(
          customerEntity: state.customerEntity,
        );
      },
    );
  }
}

class _HomePage extends StatelessWidget {
  const _HomePage({
    Key? key,
    required this.customerEntity,
  }) : super(key: key);

  final CustomerEntity? customerEntity;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return Scaffold(
      appBar: AppBar(
        title: Text(
          '${StringConstants.hello}, ${customerEntity?.name}',
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(NumbersConstants.kComponentSpacer16),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                StringConstants.balance,
                style: theme.textTheme.headline6,
              ),
              const SizedBox(height: NumbersConstants.kComponentSpacer16),
              Text(
                '${customerEntity?.balance?.toDouble().toCurrency}',
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
                itemCount:
                    customerEntity?.offers?.length ?? NumbersConstants.kZero,
                itemBuilder: (context, index) {
                  final offerEntity = customerEntity?.offers?[index];

                  return _OfferTile(
                    offerEntity: offerEntity,
                  );
                },
              )
            ],
          ),
        ),
      ),
    );
  }
}

class _OfferTile extends StatelessWidget {
  const _OfferTile({
    Key? key,
    required this.offerEntity,
  }) : super(key: key);

  final OfferEntity? offerEntity;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return InkWell(
      onTap: () => showOfferBottomSheet(
        context: context,
        offerEntity: offerEntity,
      ),
      child: Row(
        children: [
          Container(
            width: NumbersConstants.containerImageHomeHeight,
            padding: const EdgeInsets.only(
              right: NumbersConstants.kComponentSpacer16,
            ),
            child: Image.network(
              '${offerEntity?.product?.image}',
              fit: BoxFit.cover,
              height: NumbersConstants.imageHomeHeight,
            ),
          ),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                '${offerEntity?.product?.name}',
                textAlign: TextAlign.center,
              ),
              Text(
                '${offerEntity?.price?.toDouble().toCurrency}',
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
