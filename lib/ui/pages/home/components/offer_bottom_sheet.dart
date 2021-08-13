import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:nuconta_marketplace/domain/entities/entities.dart';
import 'package:nuconta_marketplace/ui/pages/pages.dart';
import 'package:nuconta_marketplace/ui/utils/utils.dart';

Future<void> showOfferBottomSheet({
  required BuildContext context,
  required OfferEntity? offerEntity,
}) async {
  await showModalBottomSheet<void>(
    isScrollControlled: true,
    context: context,
    builder: (BuildContext context) {
      final theme = Theme.of(context);
      final homeCubit = BlocProvider.of<HomeCubit>(context);

      return FractionallySizedBox(
        heightFactor: NumbersConstants.bottomSheetHeightFactor,
        child: Padding(
          padding: const EdgeInsets.all(
            NumbersConstants.kComponentSpacer16,
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              Image.network(
                '${offerEntity?.product?.image}',
                fit: BoxFit.cover,
                width: double.infinity,
                height: NumbersConstants.bottomSheetImageHeight,
              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const SizedBox(height: NumbersConstants.kComponentSpacer16),
                  Text(
                    '${offerEntity?.product?.name}',
                    textAlign: TextAlign.center,
                    style: theme.textTheme.headline5,
                  ),
                  Text(
                    '${offerEntity?.price?.toDouble().toCurrency}',
                    style: theme.textTheme.headline6?.copyWith(
                      fontWeight: FontWeight.w700,
                    ),
                  ),
                  const SizedBox(height: NumbersConstants.kComponentSpacer16),
                  Text('${offerEntity?.product?.description}'),
                  const SizedBox(height: NumbersConstants.kComponentSpacer32),
                  SizedBox(
                    width: double.infinity,
                    child: ElevatedButton(
                      onPressed: () {
                        Navigator.pop(context);
                        homeCubit.handlePurchaseProduct(
                          offerId: offerEntity!.id,
                        );
                      },
                      child: const Text(StringConstants.buyNow),
                    ),
                  )
                ],
              ),
            ],
          ),
        ),
      );
    },
    shape: const RoundedRectangleBorder(
      borderRadius: BorderRadius.vertical(
        top: Radius.circular(NumbersConstants.kComponentSpacer16),
      ),
    ),
  );
}
