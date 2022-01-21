import 'package:cached_network_image/cached_network_image.dart';
import 'package:e_commerce_app/constant.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

import '/models/models.dart';

class SingleOrderItem extends StatefulWidget {
  final OrderItem? orders;

  const SingleOrderItem({Key? key, this.orders}) : super(key: key);

  @override
  State<SingleOrderItem> createState() => _SingleOrderItemState();
}

class _SingleOrderItemState extends State<SingleOrderItem> {
  bool _isExpanded = false;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          margin: const EdgeInsets.only(
            top: kDefaultPadding,
            left: kDefaultPadding,
            right: kDefaultPadding,
          ),
          padding: const EdgeInsets.all(10),
          decoration: BoxDecoration(
            color: kPrimaryColor!.withOpacity(0.10),
            borderRadius: BorderRadius.circular(kDefaultPadding / 2),
            boxShadow: [kDefaultShadow],
          ),
          child: Row(
            children: [
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    '\$${widget.orders!.amount!.toStringAsFixed(2)}',
                    style: Theme.of(context).textTheme.headline6,
                  ),
                  const SizedBox(
                    height: kDefaultPadding / 2,
                  ),
                  Text(
                    DateFormat('dd/MM/yyyy - hh:mm')
                        .format(widget.orders!.dateTime!),
                    style: Theme.of(context).textTheme.bodyText1,
                  ),
                ],
              ),
              const Spacer(),
              IconButton(
                onPressed: () {
                  setState(() {
                    _isExpanded = !_isExpanded;
                  });
                },
                icon: Icon(_isExpanded ? Icons.expand_less : Icons.expand_more),
              )
            ],
          ),
        ),
        if (_isExpanded)
          Container(
            margin:
                const EdgeInsets.symmetric(horizontal: kDefaultPadding * 1.5),
            height: 120,
            decoration: BoxDecoration(
                color: kPrimaryColor!.withOpacity(0.10),
                borderRadius: const BorderRadius.only(
                  bottomRight: Radius.circular(20),
                  bottomLeft: Radius.circular(20),
                )),
            child: ListView(
              scrollDirection: Axis.horizontal,
              children: widget.orders!.products!
                  .map(
                    (prod) => Container(
                      margin: const EdgeInsets.symmetric(
                        horizontal: kDefaultPadding / 4,
                        vertical: kDefaultPadding / 4,
                      ),
                      child: Column(
                        children: [
                          CachedNetworkImage(
                            imageBuilder: (context, imageProvider) => Container(
                              decoration: BoxDecoration(
                                borderRadius:
                                    BorderRadius.circular(kDefaultPadding / 2),
                                image: DecorationImage(
                                  image: imageProvider,
                                  fit: BoxFit.cover,
                                ),
                              ),
                              height: 70,
                              width: 70,
                            ),
                            imageUrl: prod.imageUrl!,
                          ),
                          Text(prod.title!),
                          Text('${prod.quantity} x ${prod.price}'),
                        ],
                      ),
                    ),
                  )
                  .toList(),
            ),
          )
      ],
    );
  }
}
