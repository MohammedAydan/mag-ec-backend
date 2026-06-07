// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'serializers.dart';

// **************************************************************************
// BuiltValueGenerator
// **************************************************************************

Serializers _$serializers = (Serializers().toBuilder()
      ..add(AddCartItemDto.serializer)
      ..add(AddWishlistItemDto.serializer)
      ..add(AdjustStockDto.serializer)
      ..add(AdjustStockDtoTypeEnum.serializer)
      ..add(AdminAccessCheckResponseDto.serializer)
      ..add(AdminCatalogAttributeDto.serializer)
      ..add(AdminCatalogAttributeOptionDto.serializer)
      ..add(AdminCatalogBrandDto.serializer)
      ..add(AdminCatalogCategoryDto.serializer)
      ..add(AdminCatalogCollectionDto.serializer)
      ..add(AdminCatalogMediaDto.serializer)
      ..add(AdminCatalogProductDto.serializer)
      ..add(AdminCatalogProductTypeAttributeDto.serializer)
      ..add(AdminCatalogProductTypeDto.serializer)
      ..add(AdminCatalogProductVariantOptionValueDto.serializer)
      ..add(AdminCatalogRelationLinkDto.serializer)
      ..add(AdminCatalogTagDto.serializer)
      ..add(AdminCatalogTranslationDto.serializer)
      ..add(AdminCatalogVariantDto.serializer)
      ..add(AdminCustomerSummaryDto.serializer)
      ..add(AdminLegalReferencesResponseDto.serializer)
      ..add(AdminPaginatedCatalogProductsDto.serializer)
      ..add(AdminPermissionDto.serializer)
      ..add(AdminRoleDto.serializer)
      ..add(ApplyCouponDto.serializer)
      ..add(AttachMediaDto.serializer)
      ..add(AttachedMediaResponseDto.serializer)
      ..add(AttachedMediaTranslationDto.serializer)
      ..add(AttributeOptionDto.serializer)
      ..add(AttributeOptionTranslationDto.serializer)
      ..add(AttributeTranslationDto.serializer)
      ..add(AuditLogActorDto.serializer)
      ..add(AuditLogResponseDto.serializer)
      ..add(AuthResponseDto.serializer)
      ..add(AuthUserDto.serializer)
      ..add(CancelOrderDto.serializer)
      ..add(CartItemResponseDto.serializer)
      ..add(CartResponseDto.serializer)
      ..add(CatalogLocalizedReferenceDto.serializer)
      ..add(CatalogMediaSummaryDto.serializer)
      ..add(CatalogProductSummaryDto.serializer)
      ..add(CatalogStatusResponseDto.serializer)
      ..add(CatalogVariantOptionSummaryDto.serializer)
      ..add(CatalogVariantPriceDto.serializer)
      ..add(CatalogVariantSummaryDto.serializer)
      ..add(CheckoutAddressDto.serializer)
      ..add(CheckoutCartPreviewDto.serializer)
      ..add(CheckoutPaymentAttemptDto.serializer)
      ..add(CheckoutPaymentReadinessDto.serializer)
      ..add(CheckoutPlaceOrderDto.serializer)
      ..add(CheckoutPlaceOrderDtoPaymentMethodEnum.serializer)
      ..add(CheckoutPlaceOrderResponseDto.serializer)
      ..add(CheckoutPreviewAppliedPromotionDto.serializer)
      ..add(CheckoutPreviewDto.serializer)
      ..add(CheckoutPreviewItemDto.serializer)
      ..add(CheckoutPreviewItemResponseDto.serializer)
      ..add(CheckoutPreviewItemStockDto.serializer)
      ..add(CheckoutPreviewResponseDto.serializer)
      ..add(CheckoutPreviewShippingMethodDto.serializer)
      ..add(ContentPageResponseDto.serializer)
      ..add(CouponResponseDto.serializer)
      ..add(CreateAdminRoleDto.serializer)
      ..add(CreateAttributeDto.serializer)
      ..add(CreateAttributeDtoInputTypeEnum.serializer)
      ..add(CreateBrandDto.serializer)
      ..add(CreateCartDto.serializer)
      ..add(CreateCategoryDto.serializer)
      ..add(CreateCollectionDto.serializer)
      ..add(CreateMediaUploadIntentDto.serializer)
      ..add(CreateMediaUploadIntentDtoMediaTypeEnum.serializer)
      ..add(CreateMediaUploadIntentDtoRoleEnum.serializer)
      ..add(CreateProductDto.serializer)
      ..add(CreateProductTypeDto.serializer)
      ..add(CreateProductVariantDto.serializer)
      ..add(CreateReportExportDto.serializer)
      ..add(CreateReportExportDtoReportTypeEnum.serializer)
      ..add(CreateReturnRequestDto.serializer)
      ..add(CreateReturnRequestItemDto.serializer)
      ..add(CreateReturnRequestItemDtoRequestedDispositionEnum.serializer)
      ..add(CreateReviewDto.serializer)
      ..add(CreateShipmentDto.serializer)
      ..add(CreateShipmentItemDto.serializer)
      ..add(CreateTagDto.serializer)
      ..add(ExecuteReturnRefundDto.serializer)
      ..add(FulfillmentItemDto.serializer)
      ..add(FulfillmentResponseDto.serializer)
      ..add(HealthIndicatorDetailDto.serializer)
      ..add(HealthLivenessResponseDto.serializer)
      ..add(HealthReadinessResponseDto.serializer)
      ..add(InventoryKpisResponseDto.serializer)
      ..add(InventoryKpisStockMetricDto.serializer)
      ..add(InventoryKpisStockSumDto.serializer)
      ..add(InvitationSentResponseDto.serializer)
      ..add(InviteStaffDto.serializer)
      ..add(LegalReferencesResponseDto.serializer)
      ..add(LoginDto.serializer)
      ..add(LogoutDto.serializer)
      ..add(ManualTaxRateResponseDto.serializer)
      ..add(MediaTranslationDto.serializer)
      ..add(MediaUploadHeadersDto.serializer)
      ..add(MediaUploadIntentResponseDto.serializer)
      ..add(MergeCartDto.serializer)
      ..add(NotificationPreferenceResponseDto.serializer)
      ..add(NotificationResponseDto.serializer)
      ..add(NotificationUserBriefDto.serializer)
      ..add(OrderAddressDto.serializer)
      ..add(OrderAppliedPromotionDto.serializer)
      ..add(OrderBriefDto.serializer)
      ..add(OrderLineItemDto.serializer)
      ..add(OrderRefundDto.serializer)
      ..add(OrderReturnRequestDto.serializer)
      ..add(OrderReturnRequestItemDto.serializer)
      ..add(OrderShipmentDto.serializer)
      ..add(OrderShipmentItemDto.serializer)
      ..add(OrderShippingMethodDetailsDto.serializer)
      ..add(PaginatedAuditLogsDto.serializer)
      ..add(PaginatedCatalogProductsDto.serializer)
      ..add(PaginatedNotificationsDto.serializer)
      ..add(PaginatedPaymentAttemptsDto.serializer)
      ..add(PaginatedPaymentWebhookEventsDto.serializer)
      ..add(PaginatedRefundsDto.serializer)
      ..add(PaginatedReportExportsDto.serializer)
      ..add(PaginatedReviewsDto.serializer)
      ..add(PaginatedStockMovementsDto.serializer)
      ..add(PaginationDto.serializer)
      ..add(PasswordResetConfirmResponseDto.serializer)
      ..add(PasswordResetRequestResponseDto.serializer)
      ..add(PaymentAttemptResponseDto.serializer)
      ..add(PaymentWebhookEventResponseDto.serializer)
      ..add(PricingPreviewAppliedPromotionDto.serializer)
      ..add(PricingPreviewLineItemDto.serializer)
      ..add(PricingPreviewResponseDto.serializer)
      ..add(PricingPreviewShippingMethodDto.serializer)
      ..add(ProductTranslationDto.serializer)
      ..add(ProductTypeAttributeLinkDto.serializer)
      ..add(ProductVariantDto.serializer)
      ..add(ProductVariantTranslationDto.serializer)
      ..add(PromotionPerformanceDto.serializer)
      ..add(PromotionPerformanceSumDto.serializer)
      ..add(PromotionResponseDto.serializer)
      ..add(PublicLegalReferenceDto.serializer)
      ..add(PushDeviceResponseDto.serializer)
      ..add(ReceiveReturnRequestDto.serializer)
      ..add(ReceiveReturnRequestItemDto.serializer)
      ..add(ReceiveReturnRequestItemDtoFinalDispositionEnum.serializer)
      ..add(RefreshTokenDto.serializer)
      ..add(RefundResponseDto.serializer)
      ..add(RegisterDto.serializer)
      ..add(RegisterPushDeviceDto.serializer)
      ..add(RegisterPushDeviceDtoPlatformEnum.serializer)
      ..add(RegisterResponseDto.serializer)
      ..add(ReportExportDownloadResponseDto.serializer)
      ..add(ReportExportResponseDto.serializer)
      ..add(ReportExportUserBriefDto.serializer)
      ..add(ReportingCountMetricDto.serializer)
      ..add(RequestPasswordResetDto.serializer)
      ..add(ResetPasswordDto.serializer)
      ..add(ReturnRequestItemResponseDto.serializer)
      ..add(ReturnRequestResponseDto.serializer)
      ..add(ReviewModerationActionDto.serializer)
      ..add(ReviewModerationDto.serializer)
      ..add(ReviewModerationDtoDecisionEnum.serializer)
      ..add(ReviewOrderLineDto.serializer)
      ..add(ReviewProductDto.serializer)
      ..add(ReviewProductTranslationDto.serializer)
      ..add(ReviewResponseDto.serializer)
      ..add(ReviewReturnRequestDto.serializer)
      ..add(ReviewReturnRequestDtoDecisionEnum.serializer)
      ..add(SalesSummaryAmountSumDto.serializer)
      ..add(SalesSummaryLinesMetricDto.serializer)
      ..add(SalesSummaryLinesSumDto.serializer)
      ..add(SalesSummaryMetricDto.serializer)
      ..add(SalesSummaryRefundsMetricDto.serializer)
      ..add(SalesSummaryRefundsSumDto.serializer)
      ..add(SalesSummaryResponseDto.serializer)
      ..add(SerializedOrderDto.serializer)
      ..add(ShippingMethodResponseDto.serializer)
      ..add(ShippingZoneResponseDto.serializer)
      ..add(StaffDetailDto.serializer)
      ..add(StaffStatusResponseDto.serializer)
      ..add(StaffSummaryDto.serializer)
      ..add(StockAdjustmentResponseDto.serializer)
      ..add(StockLevelResponseDto.serializer)
      ..add(StockLevelVariantDto.serializer)
      ..add(StockLevelWarehouseDto.serializer)
      ..add(StockMovementActorDto.serializer)
      ..add(StockMovementItemDto.serializer)
      ..add(StockMovementVariantDto.serializer)
      ..add(StockMovementWarehouseDto.serializer)
      ..add(StockReservationResponseDto.serializer)
      ..add(StockReservationUserDto.serializer)
      ..add(StockReservationVariantDto.serializer)
      ..add(StockReservationWarehouseDto.serializer)
      ..add(StoreSettingResponseDto.serializer)
      ..add(TaxClassResponseDto.serializer)
      ..add(TopProductDto.serializer)
      ..add(TopProductSumDto.serializer)
      ..add(TranslationDto.serializer)
      ..add(UnregisterPushDeviceResponseDto.serializer)
      ..add(UpdateAdminRolePermissionsDto.serializer)
      ..add(UpdateCartItemDto.serializer)
      ..add(UpdateLegalReferencesDto.serializer)
      ..add(UpdatePricingBehaviorDto.serializer)
      ..add(UpdateProductDto.serializer)
      ..add(UpdateProductVariantDto.serializer)
      ..add(UpdateShipmentStatusDto.serializer)
      ..add(UpdateShipmentStatusDtoStatusEnum.serializer)
      ..add(UpdateStaffRolesDto.serializer)
      ..add(UpdateStaffStatusDto.serializer)
      ..add(UpdateStaffStatusDtoStatusEnum.serializer)
      ..add(UpdateStoreCurrencyDto.serializer)
      ..add(UpsertContentPageDto.serializer)
      ..add(UpsertContentPageDtoStatusEnum.serializer)
      ..add(UpsertCouponDto.serializer)
      ..add(UpsertCouponDtoStatusEnum.serializer)
      ..add(UpsertManualTaxRateDto.serializer)
      ..add(UpsertNotificationPreferenceDto.serializer)
      ..add(UpsertNotificationPreferenceDtoChannelEnum.serializer)
      ..add(UpsertPromotionDto.serializer)
      ..add(UpsertPromotionDtoRewardTypeEnum.serializer)
      ..add(UpsertPromotionDtoStatusEnum.serializer)
      ..add(UpsertPromotionDtoTriggerEnum.serializer)
      ..add(UpsertShippingMethodDto.serializer)
      ..add(UpsertShippingMethodDtoRateTypeEnum.serializer)
      ..add(UpsertShippingZoneDto.serializer)
      ..add(UpsertTaxClassDto.serializer)
      ..add(UpsertVariantPriceDto.serializer)
      ..add(UserProfileDto.serializer)
      ..add(UserRoleDto.serializer)
      ..add(VariantOptionValueDto.serializer)
      ..add(VariantPriceResponseDto.serializer)
      ..add(VerificationRequestResponseDto.serializer)
      ..add(VerifyEmailDto.serializer)
      ..add(VerifyEmailResponseDto.serializer)
      ..add(WishlistItemResponseDto.serializer)
      ..add(WishlistResponseDto.serializer)
      ..addBuilderFactory(
          const FullType(
              BuiltList, const [const FullType(AdminCatalogProductDto)]),
          () => ListBuilder<AdminCatalogProductDto>())
      ..addBuilderFactory(
          const FullType(
              BuiltList, const [const FullType(AdminCatalogTranslationDto)]),
          () => ListBuilder<AdminCatalogTranslationDto>())
      ..addBuilderFactory(
          const FullType(
              BuiltList, const [const FullType(AdminCatalogTranslationDto)]),
          () => ListBuilder<AdminCatalogTranslationDto>())
      ..addBuilderFactory(
          const FullType(
              BuiltList, const [const FullType(AdminCatalogTranslationDto)]),
          () => ListBuilder<AdminCatalogTranslationDto>())
      ..addBuilderFactory(
          const FullType(
              BuiltList, const [const FullType(AdminCatalogTranslationDto)]),
          () => ListBuilder<AdminCatalogTranslationDto>())
      ..addBuilderFactory(
          const FullType(
              BuiltList, const [const FullType(AdminCatalogTranslationDto)]),
          () => ListBuilder<AdminCatalogTranslationDto>())
      ..addBuilderFactory(
          const FullType(
              BuiltList, const [const FullType(AdminCatalogTranslationDto)]),
          () => ListBuilder<AdminCatalogTranslationDto>())
      ..addBuilderFactory(
          const FullType(BuiltList,
              const [const FullType(AdminCatalogAttributeOptionDto)]),
          () => ListBuilder<AdminCatalogAttributeOptionDto>())
      ..addBuilderFactory(
          const FullType(
              BuiltList, const [const FullType(AdminCatalogTranslationDto)]),
          () => ListBuilder<AdminCatalogTranslationDto>())
      ..addBuilderFactory(
          const FullType(BuiltList,
              const [const FullType(AdminCatalogProductTypeAttributeDto)]),
          () => ListBuilder<AdminCatalogProductTypeAttributeDto>())
      ..addBuilderFactory(
          const FullType(
              BuiltList, const [const FullType(AdminCatalogTranslationDto)]),
          () => ListBuilder<AdminCatalogTranslationDto>())
      ..addBuilderFactory(
          const FullType(BuiltList,
              const [const FullType(AdminCatalogProductVariantOptionValueDto)]),
          () => ListBuilder<AdminCatalogProductVariantOptionValueDto>())
      ..addBuilderFactory(
          const FullType(
              BuiltList, const [const FullType(AdminCatalogTranslationDto)]),
          () => ListBuilder<AdminCatalogTranslationDto>())
      ..addBuilderFactory(
          const FullType(
              BuiltList, const [const FullType(AdminCatalogVariantDto)]),
          () => ListBuilder<AdminCatalogVariantDto>())
      ..addBuilderFactory(
          const FullType(
              BuiltList, const [const FullType(AdminCatalogRelationLinkDto)]),
          () => ListBuilder<AdminCatalogRelationLinkDto>())
      ..addBuilderFactory(
          const FullType(
              BuiltList, const [const FullType(AdminCatalogRelationLinkDto)]),
          () => ListBuilder<AdminCatalogRelationLinkDto>())
      ..addBuilderFactory(
          const FullType(
              BuiltList, const [const FullType(AdminCatalogRelationLinkDto)]),
          () => ListBuilder<AdminCatalogRelationLinkDto>())
      ..addBuilderFactory(
          const FullType(
              BuiltList, const [const FullType(AdminCatalogMediaDto)]),
          () => ListBuilder<AdminCatalogMediaDto>())
      ..addBuilderFactory(
          const FullType(BuiltList, const [const FullType(AdminPermissionDto)]),
          () => ListBuilder<AdminPermissionDto>())
      ..addBuilderFactory(
          const FullType(
              BuiltList, const [const FullType(AttachedMediaTranslationDto)]),
          () => ListBuilder<AttachedMediaTranslationDto>())
      ..addBuilderFactory(
          const FullType(
              BuiltList, const [const FullType(AttachedMediaTranslationDto)]),
          () => ListBuilder<AttachedMediaTranslationDto>())
      ..addBuilderFactory(
          const FullType(
              BuiltList, const [const FullType(AttributeOptionTranslationDto)]),
          () => ListBuilder<AttributeOptionTranslationDto>())
      ..addBuilderFactory(
          const FullType(
              BuiltList, const [const FullType(AttributeTranslationDto)]),
          () => ListBuilder<AttributeTranslationDto>())
      ..addBuilderFactory(
          const FullType(BuiltList, const [const FullType(AttributeOptionDto)]),
          () => ListBuilder<AttributeOptionDto>())
      ..addBuilderFactory(
          const FullType(
              BuiltList, const [const FullType(AuditLogResponseDto)]),
          () => ListBuilder<AuditLogResponseDto>())
      ..addBuilderFactory(
          const FullType(
              BuiltList, const [const FullType(CartItemResponseDto)]),
          () => ListBuilder<CartItemResponseDto>())
      ..addBuilderFactory(
          const FullType(
              BuiltList, const [const FullType(CatalogLocalizedReferenceDto)]),
          () => ListBuilder<CatalogLocalizedReferenceDto>())
      ..addBuilderFactory(
          const FullType(
              BuiltList, const [const FullType(CatalogLocalizedReferenceDto)]),
          () => ListBuilder<CatalogLocalizedReferenceDto>())
      ..addBuilderFactory(
          const FullType(
              BuiltList, const [const FullType(CatalogLocalizedReferenceDto)]),
          () => ListBuilder<CatalogLocalizedReferenceDto>())
      ..addBuilderFactory(
          const FullType(
              BuiltList, const [const FullType(CatalogMediaSummaryDto)]),
          () => ListBuilder<CatalogMediaSummaryDto>())
      ..addBuilderFactory(
          const FullType(
              BuiltList, const [const FullType(CatalogVariantSummaryDto)]),
          () => ListBuilder<CatalogVariantSummaryDto>())
      ..addBuilderFactory(
          const FullType(
              BuiltList, const [const FullType(CatalogProductSummaryDto)]),
          () => ListBuilder<CatalogProductSummaryDto>())
      ..addBuilderFactory(
          const FullType(BuiltList,
              const [const FullType(CatalogVariantOptionSummaryDto)]),
          () => ListBuilder<CatalogVariantOptionSummaryDto>())
      ..addBuilderFactory(
          const FullType(BuiltList,
              const [const FullType(CheckoutPreviewAppliedPromotionDto)]),
          () => ListBuilder<CheckoutPreviewAppliedPromotionDto>())
      ..addBuilderFactory(
          const FullType(BuiltList, const [const FullType(String)]),
          () => ListBuilder<String>())
      ..addBuilderFactory(
          const FullType(BuiltList,
              const [const FullType(CheckoutPreviewItemResponseDto)]),
          () => ListBuilder<CheckoutPreviewItemResponseDto>())
      ..addBuilderFactory(
          const FullType(BuiltList,
              const [const FullType(CheckoutPreviewShippingMethodDto)]),
          () => ListBuilder<CheckoutPreviewShippingMethodDto>())
      ..addBuilderFactory(
          const FullType(
              BuiltList, const [const FullType(CheckoutPreviewItemDto)]),
          () => ListBuilder<CheckoutPreviewItemDto>())
      ..addBuilderFactory(
          const FullType(BuiltList, const [const FullType(String)]),
          () => ListBuilder<String>())
      ..addBuilderFactory(
          const FullType(
              BuiltList, const [const FullType(CreateReturnRequestItemDto)]),
          () => ListBuilder<CreateReturnRequestItemDto>())
      ..addBuilderFactory(
          const FullType(
              BuiltList, const [const FullType(CreateShipmentItemDto)]),
          () => ListBuilder<CreateShipmentItemDto>())
      ..addBuilderFactory(
          const FullType(BuiltList, const [const FullType(FulfillmentItemDto)]),
          () => ListBuilder<FulfillmentItemDto>())
      ..addBuilderFactory(
          const FullType(
              BuiltList, const [const FullType(MediaTranslationDto)]),
          () => ListBuilder<MediaTranslationDto>())
      ..addBuilderFactory(
          const FullType(
              BuiltList, const [const FullType(NotificationResponseDto)]),
          () => ListBuilder<NotificationResponseDto>())
      ..addBuilderFactory(
          const FullType(BuiltList, const [const FullType(OrderAddressDto)]),
          () => ListBuilder<OrderAddressDto>())
      ..addBuilderFactory(
          const FullType(BuiltList, const [const FullType(OrderLineItemDto)]),
          () => ListBuilder<OrderLineItemDto>())
      ..addBuilderFactory(
          const FullType(
              BuiltList, const [const FullType(OrderAppliedPromotionDto)]),
          () => ListBuilder<OrderAppliedPromotionDto>())
      ..addBuilderFactory(
          const FullType(BuiltList, const [const FullType(OrderShipmentDto)]),
          () => ListBuilder<OrderShipmentDto>())
      ..addBuilderFactory(
          const FullType(
              BuiltList, const [const FullType(OrderReturnRequestDto)]),
          () => ListBuilder<OrderReturnRequestDto>())
      ..addBuilderFactory(
          const FullType(BuiltList, const [const FullType(OrderRefundDto)]),
          () => ListBuilder<OrderRefundDto>())
      ..addBuilderFactory(
          const FullType(BuiltList, const [const FullType(OrderAddressDto)]),
          () => ListBuilder<OrderAddressDto>())
      ..addBuilderFactory(
          const FullType(BuiltList, const [const FullType(OrderLineItemDto)]),
          () => ListBuilder<OrderLineItemDto>())
      ..addBuilderFactory(
          const FullType(
              BuiltList, const [const FullType(OrderAppliedPromotionDto)]),
          () => ListBuilder<OrderAppliedPromotionDto>())
      ..addBuilderFactory(
          const FullType(BuiltList, const [const FullType(OrderShipmentDto)]),
          () => ListBuilder<OrderShipmentDto>())
      ..addBuilderFactory(
          const FullType(
              BuiltList, const [const FullType(OrderReturnRequestDto)]),
          () => ListBuilder<OrderReturnRequestDto>())
      ..addBuilderFactory(
          const FullType(BuiltList, const [const FullType(OrderRefundDto)]),
          () => ListBuilder<OrderRefundDto>())
      ..addBuilderFactory(
          const FullType(
              BuiltList, const [const FullType(OrderReturnRequestItemDto)]),
          () => ListBuilder<OrderReturnRequestItemDto>())
      ..addBuilderFactory(
          const FullType(BuiltList, const [const FullType(OrderRefundDto)]),
          () => ListBuilder<OrderRefundDto>())
      ..addBuilderFactory(
          const FullType(
              BuiltList, const [const FullType(OrderShipmentItemDto)]),
          () => ListBuilder<OrderShipmentItemDto>())
      ..addBuilderFactory(
          const FullType(
              BuiltList, const [const FullType(PaymentAttemptResponseDto)]),
          () => ListBuilder<PaymentAttemptResponseDto>())
      ..addBuilderFactory(
          const FullType(BuiltList,
              const [const FullType(PaymentWebhookEventResponseDto)]),
          () => ListBuilder<PaymentWebhookEventResponseDto>())
      ..addBuilderFactory(
          const FullType(
              BuiltList, const [const FullType(PricingPreviewLineItemDto)]),
          () => ListBuilder<PricingPreviewLineItemDto>())
      ..addBuilderFactory(
          const FullType(BuiltList,
              const [const FullType(PricingPreviewAppliedPromotionDto)]),
          () => ListBuilder<PricingPreviewAppliedPromotionDto>())
      ..addBuilderFactory(
          const FullType(BuiltList, const [const FullType(String)]),
          () => ListBuilder<String>())
      ..addBuilderFactory(
          const FullType(BuiltList,
              const [const FullType(PricingPreviewShippingMethodDto)]),
          () => ListBuilder<PricingPreviewShippingMethodDto>())
      ..addBuilderFactory(
          const FullType(
              BuiltList, const [const FullType(ProductTranslationDto)]),
          () => ListBuilder<ProductTranslationDto>())
      ..addBuilderFactory(
          const FullType(BuiltList, const [const FullType(ProductVariantDto)]),
          () => ListBuilder<ProductVariantDto>())
      ..addBuilderFactory(
          const FullType(BuiltList, const [const FullType(String)]),
          () => ListBuilder<String>())
      ..addBuilderFactory(
          const FullType(BuiltList, const [const FullType(String)]),
          () => ListBuilder<String>())
      ..addBuilderFactory(
          const FullType(BuiltList, const [const FullType(String)]),
          () => ListBuilder<String>())
      ..addBuilderFactory(
          const FullType(
              BuiltList, const [const FullType(ProductVariantTranslationDto)]),
          () => ListBuilder<ProductVariantTranslationDto>())
      ..addBuilderFactory(
          const FullType(
              BuiltList, const [const FullType(VariantOptionValueDto)]),
          () => ListBuilder<VariantOptionValueDto>())
      ..addBuilderFactory(
          const FullType(
              BuiltList, const [const FullType(ProductVariantTranslationDto)]),
          () => ListBuilder<ProductVariantTranslationDto>())
      ..addBuilderFactory(
          const FullType(
              BuiltList, const [const FullType(VariantOptionValueDto)]),
          () => ListBuilder<VariantOptionValueDto>())
      ..addBuilderFactory(
          const FullType(
              BuiltList, const [const FullType(ProductVariantTranslationDto)]),
          () => ListBuilder<ProductVariantTranslationDto>())
      ..addBuilderFactory(
          const FullType(
              BuiltList, const [const FullType(VariantOptionValueDto)]),
          () => ListBuilder<VariantOptionValueDto>())
      ..addBuilderFactory(
          const FullType(
              BuiltList, const [const FullType(ReceiveReturnRequestItemDto)]),
          () => ListBuilder<ReceiveReturnRequestItemDto>())
      ..addBuilderFactory(
          const FullType(BuiltList, const [const FullType(RefundResponseDto)]),
          () => ListBuilder<RefundResponseDto>())
      ..addBuilderFactory(
          const FullType(
              BuiltList, const [const FullType(ReportExportResponseDto)]),
          () => ListBuilder<ReportExportResponseDto>())
      ..addBuilderFactory(
          const FullType(
              BuiltList, const [const FullType(ReturnRequestItemResponseDto)]),
          () => ListBuilder<ReturnRequestItemResponseDto>())
      ..addBuilderFactory(
          const FullType(BuiltList, const [const FullType(OrderRefundDto)]),
          () => ListBuilder<OrderRefundDto>())
      ..addBuilderFactory(
          const FullType(
              BuiltList, const [const FullType(ReviewModerationActionDto)]),
          () => ListBuilder<ReviewModerationActionDto>())
      ..addBuilderFactory(
          const FullType(
              BuiltList, const [const FullType(ReviewProductTranslationDto)]),
          () => ListBuilder<ReviewProductTranslationDto>())
      ..addBuilderFactory(
          const FullType(BuiltList, const [const FullType(ReviewResponseDto)]),
          () => ListBuilder<ReviewResponseDto>())
      ..addBuilderFactory(
          const FullType(
              BuiltList, const [const FullType(StockMovementItemDto)]),
          () => ListBuilder<StockMovementItemDto>())
      ..addBuilderFactory(
          const FullType(BuiltList, const [const FullType(String)]),
          () => ListBuilder<String>())
      ..addBuilderFactory(
          const FullType(BuiltList, const [const FullType(String)]),
          () => ListBuilder<String>())
      ..addBuilderFactory(
          const FullType(BuiltList, const [const FullType(String)]),
          () => ListBuilder<String>())
      ..addBuilderFactory(
          const FullType(BuiltList, const [const FullType(String)]),
          () => ListBuilder<String>())
      ..addBuilderFactory(
          const FullType(BuiltList, const [const FullType(String)]),
          () => ListBuilder<String>())
      ..addBuilderFactory(
          const FullType(BuiltList, const [const FullType(String)]),
          () => ListBuilder<String>())
      ..addBuilderFactory(
          const FullType(BuiltList, const [const FullType(String)]),
          () => ListBuilder<String>())
      ..addBuilderFactory(
          const FullType(BuiltList, const [const FullType(String)]),
          () => ListBuilder<String>())
      ..addBuilderFactory(
          const FullType(BuiltList, const [const FullType(String)]),
          () => ListBuilder<String>())
      ..addBuilderFactory(
          const FullType(
              BuiltList, const [const FullType(ProductTranslationDto)]),
          () => ListBuilder<ProductTranslationDto>())
      ..addBuilderFactory(
          const FullType(BuiltList, const [const FullType(TranslationDto)]),
          () => ListBuilder<TranslationDto>())
      ..addBuilderFactory(
          const FullType(BuiltList, const [const FullType(TranslationDto)]),
          () => ListBuilder<TranslationDto>())
      ..addBuilderFactory(
          const FullType(BuiltList, const [const FullType(TranslationDto)]),
          () => ListBuilder<TranslationDto>())
      ..addBuilderFactory(
          const FullType(BuiltList, const [const FullType(TranslationDto)]),
          () => ListBuilder<TranslationDto>())
      ..addBuilderFactory(
          const FullType(BuiltList, const [const FullType(TranslationDto)]),
          () => ListBuilder<TranslationDto>())
      ..addBuilderFactory(
          const FullType(
              BuiltList, const [const FullType(ProductTypeAttributeLinkDto)]),
          () => ListBuilder<ProductTypeAttributeLinkDto>())
      ..addBuilderFactory(
          const FullType(BuiltList, const [const FullType(UserRoleDto)]),
          () => ListBuilder<UserRoleDto>())
      ..addBuilderFactory(
          const FullType(BuiltList, const [const FullType(UserRoleDto)]),
          () => ListBuilder<UserRoleDto>())
      ..addBuilderFactory(
          const FullType(
              BuiltList, const [const FullType(WishlistItemResponseDto)]),
          () => ListBuilder<WishlistItemResponseDto>())
      ..addBuilderFactory(
          const FullType(BuiltMap, const [
            const FullType(String),
            const FullType(HealthIndicatorDetailDto)
          ]),
          () => MapBuilder<String, HealthIndicatorDetailDto>())
      ..addBuilderFactory(
          const FullType(BuiltMap, const [
            const FullType(String),
            const FullType(HealthIndicatorDetailDto)
          ]),
          () => MapBuilder<String, HealthIndicatorDetailDto>())
      ..addBuilderFactory(
          const FullType(BuiltMap, const [
            const FullType(String),
            const FullType(HealthIndicatorDetailDto)
          ]),
          () => MapBuilder<String, HealthIndicatorDetailDto>())
      ..addBuilderFactory(
          const FullType(BuiltSet, const [const FullType(String)]),
          () => SetBuilder<String>()))
    .build();

// ignore_for_file: deprecated_member_use_from_same_package,type=lint
