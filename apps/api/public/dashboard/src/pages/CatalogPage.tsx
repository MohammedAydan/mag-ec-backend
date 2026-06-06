import { Plus } from 'lucide-react';
import { useNavigate } from 'react-router-dom';
import { useQuery } from '@tanstack/react-query';
import { PageShell } from '@/components/ui/PageShell';
import { DataTable } from '@/components/ui/DataTable';
import { Feedback } from '@/components/ui/Feedback';
import { ConfirmModal } from '@/components/ui/ConfirmModal';
import { PageLoading, LoadError } from '@/components/ui/PageLoading';
import { useActionForm, useDirectAction } from '@/lib/admin-actions';
import type { ActionOption } from '@/lib/admin-actions';
import { useAuth } from '@/lib/auth';
import { useT } from '@/lib/i18n';
import { asArray, chipClass, nameOf, numberOf } from '@/lib/format';

export function CatalogPage() {
  const navigate = useNavigate();
  const { request } = useAuth();
  const { t } = useT();
  const products = useQuery({
    queryKey: ['catalog', 'products'],
    queryFn: async () => asArray(await request('/catalog/admin/products?limit=50')),
  });
  const refData = useQuery({
    queryKey: ['catalog', 'refData'],
    queryFn: async () => {
      const [productTypes, brands, categories, collections, tags] = await Promise.all([
        asArray(await request('/catalog/admin/product-types')),
        asArray(await request('/catalog/admin/brands')),
        asArray(await request('/catalog/admin/categories')),
        asArray(await request('/catalog/admin/collections')),
        asArray(await request('/catalog/admin/tags')),
      ]);
      return { productTypes, brands, categories, collections, tags };
    },
    staleTime: Infinity,
  });
  const create = useActionForm([['catalog', 'products']]);
  const publish = useDirectAction([['catalog', 'products']]);

  if (products.isPending || refData.isPending) {
    return (
      <PageShell title={t('catalog.title')}>
        <PageLoading />
      </PageShell>
    );
  }

  if (products.isError) {
    return (
      <PageShell title={t('catalog.title')}>
        <LoadError error={products.error} />
      </PageShell>
    );
  }

  const { productTypes = [], brands = [], categories = [], collections = [], tags = [] } = refData.data ?? {};

  const productTypeOptions: ActionOption[] = productTypes.map((pt: Record<string, unknown>) => ({
    value: String(pt.id),
    label: String(pt.name ?? pt.key ?? pt.id),
  }));
  const brandOptions: ActionOption[] = brands.map((b: Record<string, unknown>) => ({
    value: String(b.id),
    label: String(b.name ?? b.key ?? b.id),
  }));
  const categoryOptions: ActionOption[] = categories.map((c: Record<string, unknown>) => ({
    value: String(c.id),
    label: String(c.name ?? c.key ?? c.id),
  }));
  const collectionOptions: ActionOption[] = collections.map((c: Record<string, unknown>) => ({
    value: String(c.id),
    label: String(c.name ?? c.key ?? c.id),
  }));
  const tagOptions: ActionOption[] = tags.map((t: Record<string, unknown>) => ({
    value: String(t.id),
    label: String(t.name ?? t.key ?? t.id),
  }));

  return (
    <PageShell
      title={t('catalog.title')}
      subtitle={t('catalog.subtitle')}
      actions={
        <button
          className="btn-primary"
          onClick={() =>
            create.open({
              title: t('catalog.createProduct'),
              description: t('catalog.createProductDesc'),
              path: '/catalog/admin/products',
              method: 'POST',
              submitLabel: t('catalog.createProduct'),
              values: {
                productTypeId: '',
                brandId: '',
                sku: '',
                isFeatured: false,
                categoryIds: [],
                collectionIds: [],
                tagIds: [],
                translations: [{ locale: 'en', name: '', slug: '', description: '' }],
                variants: [
                  {
                    sku: '',
                    isDefault: true,
                    translations: [{ locale: 'en', name: 'Standard' }],
                    optionValues: [],
                  },
                ],
              },
              fields: [
                {
                  name: 'productTypeId',
                  label: t('catalog.productType'),
                  type: 'select',
                  required: true,
                  width: 'half',
                  placeholder: t('catalog.selectProductType'),
                  options: productTypeOptions,
                },
                {
                  name: 'brandId',
                  label: t('catalog.brand'),
                  type: 'select',
                  width: 'half',
                  placeholder: t('catalog.selectBrand'),
                  options: brandOptions,
                },
                {
                  name: 'sku',
                  label: t('catalog.baseSku'),
                  type: 'text',
                  required: true,
                  width: 'half',
                },
                {
                  name: 'isFeatured',
                  label: t('catalog.featureProduct'),
                  type: 'switch',
                  description: t('catalog.featureDesc'),
                  width: 'half',
                },
                {
                  name: 'categoryIds',
                  label: t('catalog.categories'),
                  type: 'checkbox-list',
                  options: categoryOptions,
                  width: 'half',
                },
                {
                  name: 'collectionIds',
                  label: t('catalog.collections'),
                  type: 'checkbox-list',
                  options: collectionOptions,
                  width: 'half',
                },
                {
                  name: 'tagIds',
                  label: t('catalog.tags'),
                  type: 'checkbox-list',
                  options: tagOptions,
                },
                {
                  name: 'translations',
                  label: t('catalog.productCopy'),
                  type: 'group-list',
                  required: true,
                  minItems: 1,
                  addLabel: t('catalog.addTranslation'),
                  itemLabel: t('catalog.translation'),
                  fields: [
                    {
                      name: 'locale',
                      label: t('catalog.locale'),
                      type: 'radio',
                      required: true,
                      width: 'full',
                      options: [
                        { value: 'en', label: t('catalog.english') },
                        { value: 'ar', label: t('catalog.arabic') },
                      ],
                    },
                    {
                      name: 'name',
                      label: t('catalog.productName'),
                      type: 'text',
                      required: true,
                      width: 'half',
                    },
                    {
                      name: 'slug',
                      label: t('catalog.slug'),
                      type: 'text',
                      required: true,
                      width: 'half',
                    },
                    {
                      name: 'description',
                      label: t('common.description'),
                      type: 'textarea',
                      width: 'full',
                    },
                  ],
                },
                {
                  name: 'variants',
                  label: t('catalog.initialVariants'),
                  type: 'group-list',
                  required: true,
                  minItems: 1,
                  addLabel: t('catalog.addVariant'),
                  itemLabel: t('catalog.variant'),
                  defaultItem: {
                    sku: '',
                    isDefault: false,
                    translations: [{ locale: 'en', name: '' }],
                    optionValues: [],
                  },
                  fields: [
                    {
                      name: 'sku',
                      label: t('catalog.variantSku'),
                      type: 'text',
                      required: true,
                      width: 'half',
                    },
                    {
                      name: 'isDefault',
                      label: t('catalog.defaultVariant'),
                      type: 'switch',
                      width: 'half',
                    },
                    {
                      name: 'translations',
                      label: t('catalog.variantTranslations'),
                      type: 'group-list',
                      required: true,
                      minItems: 1,
                      addLabel: t('catalog.addTranslation'),
                      itemLabel: t('catalog.translation'),
                      fields: [
                        {
                          name: 'locale',
                          label: t('catalog.locale'),
                          type: 'radio',
                          required: true,
                          width: 'full',
                          options: [
                            { value: 'en', label: t('catalog.english') },
                            { value: 'ar', label: t('catalog.arabic') },
                          ],
                        },
                        {
                          name: 'name',
                          label: t('catalog.displayName'),
                          type: 'text',
                          required: true,
                          width: 'full',
                        },
                      ],
                    },
                    {
                      name: 'optionValues',
                      label: t('catalog.optionValues'),
                      type: 'string-list',
                      addLabel: t('catalog.addOptionValue'),
                      itemLabel: t('catalog.optionValue'),
                      emptyLabel: t('catalog.noOptionValues'),
                    },
                  ],
                },
              ],
            })
          }
        >
          <Plus size={16} /> {t('catalog.newProduct')}
        </button>
      }
    >
      <div className="space-y-4 p-6">
        <Feedback message={create.feedback ?? publish.feedback} />
        <Feedback message={publish.failure} tone="danger" />
        <div className="flex items-center justify-between">
          <p className="text-sm text-neutral-400">{products.data.length} {t('catalog.productsAvailable')}</p>
        </div>
        <DataTable headers={[t('catalog.productName'), t('catalog.productType'), t('catalog.variants'), t('common.status'), '']} empty={!products.data.length}>
          {products.data.map((product) => (
            <tr key={product.id}>
              <td>
                <strong className="block text-sm">{nameOf(product)}</strong>
                <small className="block text-xs text-neutral-400">
                  {product.translations?.[0]?.slug ?? product.slug ?? product.id}
                </small>
              </td>
              <td>{product.productType?.name ?? product.productTypeKey ?? '-'}</td>
              <td>{numberOf(product.variants?.length ?? product._count?.variants ?? 0)}</td>
              <td>
                <span className={chipClass(product.status)}
                >
                  {String(product.status ?? '-')}
                </span>
              </td>
              <td>
                <div className="flex justify-end gap-2">
                  <button className="btn-table-default" onClick={() => navigate(`/catalog/${product.id}`)}>
                    {t('common.inspect')}
                  </button>
                  <button
                    disabled={publish.pending === product.id}
                    onClick={() =>
                      void publish.run(
                        product.id,
                        `/catalog/admin/products/${product.id}/${product.status === 'PUBLISHED' ? 'archive' : 'publish'}`,
                      )
                    }
                    className={product.status === 'PUBLISHED' ? 'btn-table-danger' : 'btn-table-success'}
                  >
                    {product.status === 'PUBLISHED' ? t('catalog.archive') : t('catalog.publish')}
                  </button>
                </div>
              </td>
            </tr>
          ))}
        </DataTable>
      </div>
      <ConfirmModal
        action={create.action}
        busy={create.busy}
        error={create.error}
        fieldErrors={create.fieldErrors}
        onClose={create.close}
        onSubmit={create.execute}
      />
    </PageShell>
  );
}
