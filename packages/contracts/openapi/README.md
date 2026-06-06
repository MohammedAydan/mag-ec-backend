# Strict OpenAPI Generated Clients — TypeScript + Flutter

ضع هذه الملفات داخل:

```txt
packages/contracts/openapi/
```

الملفات الموجودة في هذه الحزمة:

```txt
generate-typescript-client.ts       # يولد TypeScript SDK حقيقي باستخدام typescript-fetch
typescript-fetch-config.yaml        # إعدادات TypeScript OpenAPI Generator
generate-flutter-client.ts          # يولد Flutter/Dart SDK حقيقي باستخدام dart-dio
dart-dio-config.yaml                # إعدادات Flutter/Dart OpenAPI Generator
generate-all-openapi-clients.ts     # يولد الاثنين معًا
test-generated-packages.ts          # يختبر كل generated package على حدي
verify-openapi-contract.ts          # يثبت أن openapi.json ثابت بعد إعادة التوليد
```

## التوليد

TypeScript فقط:

```bash
tsx packages/contracts/openapi/generate-typescript-client.ts
```

Flutter فقط:

```bash
tsx packages/contracts/openapi/generate-flutter-client.ts
```

الاثنين معًا:

```bash
tsx packages/contracts/openapi/generate-all-openapi-clients.ts
```

## verify / CI

```bash
tsx packages/contracts/openapi/generate-all-openapi-clients.ts --verify --package-manager=skip
```

## اختبار كل package لوحده

TypeScript:

```bash
tsx packages/contracts/openapi/test-generated-packages.ts --package=typescript --package-manager=npm
```

Flutter:

```bash
tsx packages/contracts/openapi/test-generated-packages.ts --package=flutter
```

الاثنين:

```bash
tsx packages/contracts/openapi/test-generated-packages.ts --all --package-manager=npm
```

## scripts مقترحة في package.json

```json
{
  "scripts": {
    "openapi:verify-contract": "tsx packages/contracts/openapi/verify-openapi-contract.ts",
    "openapi:client:ts": "tsx packages/contracts/openapi/generate-typescript-client.ts",
    "openapi:client:flutter": "tsx packages/contracts/openapi/generate-flutter-client.ts",
    "openapi:clients": "tsx packages/contracts/openapi/generate-all-openapi-clients.ts --package-manager=npm",
    "openapi:clients:verify": "tsx packages/contracts/openapi/generate-all-openapi-clients.ts --verify --package-manager=skip",
    "openapi:clients:test": "tsx packages/contracts/openapi/test-generated-packages.ts --all --package-manager=npm"
  }
}
```

## ملاحظات مهمة

- السكريبتات لا تعتبر الناتج صحيحًا إلا إذا وجدت `.openapi-generator/VERSION` و`.openapi-generator/FILES` وملفات package الأساسية.
- كل generator يكتب audit report داخل `packages/contracts/generated`.
- كل generated package يأخذ manifest إضافي: `.openapi-generation-manifest.json` يحتوي hashes للـ OpenAPI وconfig.
- غيّر `npmName` في `typescript-fetch-config.yaml` و`pubName` في `dart-dio-config.yaml` حسب اسم مشروعك الحقيقي قبل النشر.
