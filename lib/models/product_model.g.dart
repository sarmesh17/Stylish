// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'product_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$ProductResponseImpl _$$ProductResponseImplFromJson(
  Map<String, dynamic> json,
) => _$ProductResponseImpl(
  products:
      (json['products'] as List<dynamic>?)
          ?.map((e) => ProductModel.fromJson(e as Map<String, dynamic>))
          .toList(),
);

Map<String, dynamic> _$$ProductResponseImplToJson(
  _$ProductResponseImpl instance,
) => <String, dynamic>{'products': instance.products};

_$ProductModelImpl _$$ProductModelImplFromJson(Map<String, dynamic> json) =>
    _$ProductModelImpl(
      id: (json['id'] as num?)?.toInt(),
      title: json['title'] as String?,
      description: json['description'] as String?,
      category: json['category'] as String?,
      price: (json['price'] as num?)?.toDouble(),
      discountPercentage: (json['discountPercentage'] as num?)?.toDouble(),
      rating: (json['rating'] as num?)?.toDouble(),
      stock: (json['stock'] as num?)?.toInt(),
      tags: (json['tags'] as List<dynamic>?)?.map((e) => e as String).toList(),
      brand: json['brand'] as String?,
      sku: json['sku'] as String?,
      weight: (json['weight'] as num?)?.toDouble(),
      dimensions:
          json['dimensions'] == null
              ? null
              : Dimensions.fromJson(json['dimensions'] as Map<String, dynamic>),
      warrantyInformation: json['warrantyInformation'] as String?,
      shippingInformation: json['shippingInformation'] as String?,
      availabilityStatus: json['availabilityStatus'] as String?,
      reviews:
          (json['reviews'] as List<dynamic>?)
              ?.map((e) => Review.fromJson(e as Map<String, dynamic>))
              .toList(),
      returnPolicy: json['returnPolicy'] as String?,
      minimumOrderQuantity: (json['minimumOrderQuantity'] as num?)?.toInt(),
      meta:
          json['meta'] == null
              ? null
              : Meta.fromJson(json['meta'] as Map<String, dynamic>),
      images:
          (json['images'] as List<dynamic>?)?.map((e) => e as String).toList(),
      thumbnail: json['thumbnail'] as String?,
    );

Map<String, dynamic> _$$ProductModelImplToJson(_$ProductModelImpl instance) =>
    <String, dynamic>{
      'id': instance.id,
      'title': instance.title,
      'description': instance.description,
      'category': instance.category,
      'price': instance.price,
      'discountPercentage': instance.discountPercentage,
      'rating': instance.rating,
      'stock': instance.stock,
      'tags': instance.tags,
      'brand': instance.brand,
      'sku': instance.sku,
      'weight': instance.weight,
      'dimensions': instance.dimensions,
      'warrantyInformation': instance.warrantyInformation,
      'shippingInformation': instance.shippingInformation,
      'availabilityStatus': instance.availabilityStatus,
      'reviews': instance.reviews,
      'returnPolicy': instance.returnPolicy,
      'minimumOrderQuantity': instance.minimumOrderQuantity,
      'meta': instance.meta,
      'images': instance.images,
      'thumbnail': instance.thumbnail,
    };

_$DimensionsImpl _$$DimensionsImplFromJson(Map<String, dynamic> json) =>
    _$DimensionsImpl(
      width: (json['width'] as num?)?.toDouble(),
      height: (json['height'] as num?)?.toDouble(),
      depth: (json['depth'] as num?)?.toDouble(),
    );

Map<String, dynamic> _$$DimensionsImplToJson(_$DimensionsImpl instance) =>
    <String, dynamic>{
      'width': instance.width,
      'height': instance.height,
      'depth': instance.depth,
    };

_$ReviewImpl _$$ReviewImplFromJson(Map<String, dynamic> json) => _$ReviewImpl(
  rating: (json['rating'] as num?)?.toInt(),
  comment: json['comment'] as String?,
  date: json['date'] == null ? null : DateTime.parse(json['date'] as String),
  reviewerName: json['reviewerName'] as String?,
  reviewerEmail: json['reviewerEmail'] as String?,
);

Map<String, dynamic> _$$ReviewImplToJson(_$ReviewImpl instance) =>
    <String, dynamic>{
      'rating': instance.rating,
      'comment': instance.comment,
      'date': instance.date?.toIso8601String(),
      'reviewerName': instance.reviewerName,
      'reviewerEmail': instance.reviewerEmail,
    };

_$MetaImpl _$$MetaImplFromJson(Map<String, dynamic> json) => _$MetaImpl(
  createdAt:
      json['createdAt'] == null
          ? null
          : DateTime.parse(json['createdAt'] as String),
  updatedAt:
      json['updatedAt'] == null
          ? null
          : DateTime.parse(json['updatedAt'] as String),
  barcode: json['barcode'] as String?,
  qrCode: json['qrCode'] as String?,
);

Map<String, dynamic> _$$MetaImplToJson(_$MetaImpl instance) =>
    <String, dynamic>{
      'createdAt': instance.createdAt?.toIso8601String(),
      'updatedAt': instance.updatedAt?.toIso8601String(),
      'barcode': instance.barcode,
      'qrCode': instance.qrCode,
    };
