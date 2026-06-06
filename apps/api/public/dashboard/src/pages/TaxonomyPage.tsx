import { Plus } from 'lucide-react';
import { useState } from 'react';
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
import { asArray, chipClass, nameOf } from '@/lib/format';

function baseTranslationFields(t: ReturnType<typeof useT>['t']) {
  return [
    {
      name: 'locale',
      label: t('catalog.locale'),
      type: 'radio' as const,
      required: true,
      width: 'full' as const,
      options: [
        { value: 'en', label: t('catalog.english') },
        { value: 'ar', label: t('catalog.arabic') },
      ],
    },
    {
      name: 'name',
      label: t('common.name'),
      type: 'text' as const,
      required: true,
      width: 'half' as const,
    },
    {
      name: 'slug',
      label: t('catalog.slug'),
      type: 'text' as const,
      required: true,
      width: 'half' as const,
    },
  ];
}

function createActionFor(t: ReturnType<typeof useT>['t'], active: string, categoryOptions: ActionOption[], attributeOptions: ActionOption[]) {
  // Map tab key to locale key for translated entity name
  const ENTITY_LABELS: Record<string, string> = {
    brands: t('taxonomy.brands'),
    categories: t('taxonomy.categories'),
    collections: t('taxonomy.collections'),
    tags: t('taxonomy.tags'),
    attributes: t('taxonomy.attributes'),
    'product-types': t('taxonomy.productTypes'),
  };
  const entityLabel = ENTITY_LABELS[active] ?? active.replace('-', ' ');
  if (active === 'attributes') {
    return {
      title: t('taxonomy.createAttribute'),
      description: t('taxonomy.createAttributeDesc'),
      path: '/catalog/admin/attributes',
      method: 'POST',
      submitLabel: t('taxonomy.createAttribute'),
      values: {
        key: '',
        inputType: 'TEXT',
        isFilterable: true,
        isVariantDefining: false,
        sortOrder: 0,
        translations: [{ locale: 'en', name: '', slug: '', description: '' }],
        options: [],
      },
      fields: [
        { name: 'key', label: t('taxonomy.attributeKey'), type: 'text' as const, required: true, width: 'half' as const },
        {
          name: 'inputType',
          label: t('taxonomy.inputType'),
          type: 'radio' as const,
          required: true,
          width: 'full' as const,
          options: [
            { value: 'TEXT', label: t('form.text') },
            { value: 'SELECT', label: t('form.select') },
            { value: 'MULTI_SELECT', label: t('form.multiSelect') },
            { value: 'COLOR', label: t('form.color') },
            { value: 'SIZE', label: t('form.size') },
            { value: 'BOOLEAN', label: t('form.boolean') },
            { value: 'NUMBER', label: t('form.number') },
          ],
        },
        { name: 'isFilterable', label: t('taxonomy.filterable'), type: 'switch' as const, width: 'half' as const },
        { name: 'isVariantDefining', label: t('taxonomy.variantDefining'), type: 'switch' as const, width: 'half' as const },
        {
          name: 'sortOrder',
          label: t('taxonomy.sortOrder'),
          type: 'number' as const,
          min: 0,
          width: 'half' as const,
        },
        {
          name: 'translations',
          label: t('taxonomy.attributeTranslations'),
          type: 'group-list' as const,
          required: true,
          minItems: 1,
          addLabel: t('catalog.addTranslation'),
          itemLabel: t('catalog.translation'),
          fields: [
            ...baseTranslationFields(t),
            {
              name: 'description',
              label: t('common.description'),
              type: 'textarea' as const,
              width: 'full' as const,
            },
          ],
        },
        {
          name: 'options',
          label: t('taxonomy.attributeOptions'),
          type: 'group-list' as const,
          addLabel: t('taxonomy.addOption'),
          itemLabel: t('taxonomy.option'),
          emptyLabel: t('taxonomy.noOptions'),
          defaultItem: {
            key: '',
            sortOrder: 0,
            colorHex: '',
            translations: [{ locale: 'en', name: '', slug: '' }],
          },
          fields: [
            { name: 'key', label: t('taxonomy.optionKey'), type: 'text' as const, required: true, width: 'half' as const },
            { name: 'sortOrder', label: t('taxonomy.sortOrder'), type: 'number' as const, min: 0, width: 'half' as const },
            { name: 'colorHex', label: t('taxonomy.colorHex'), type: 'text' as const, width: 'half' as const },
            {
              name: 'translations',
              label: t('taxonomy.optionTranslations'),
              type: 'group-list' as const,
              required: true,
              minItems: 1,
              addLabel: t('taxonomy.addOptionTranslation'),
              itemLabel: t('taxonomy.optionTranslation'),
              fields: baseTranslationFields(t),
            },
          ],
        },
      ],
    };
  }

  if (active === 'categories') {
    return {
      title: t('taxonomy.createCategory'),
      description: t('taxonomy.createCategoryDesc'),
      path: '/catalog/admin/categories',
      method: 'POST',
      submitLabel: t('taxonomy.createCategory'),
      values: {
        key: '',
        parentId: '',
        sortOrder: 0,
        translations: [{ locale: 'en', name: '', slug: '' }],
      },
      fields: [
        { name: 'key', label: t('taxonomy.categoryKey'), type: 'text' as const, required: true, width: 'half' as const },
        { name: 'parentId', label: t('taxonomy.parentCategory'), type: 'select' as const, width: 'half' as const, placeholder: t('taxonomy.noneTopLevel'), options: categoryOptions },
        { name: 'sortOrder', label: t('taxonomy.sortOrder'), type: 'number' as const, min: 0, width: 'half' as const },
        {
          name: 'translations',
          label: t('taxonomy.categoryTranslations'),
          type: 'group-list' as const,
          required: true,
          minItems: 1,
          addLabel: t('catalog.addTranslation'),
          itemLabel: t('catalog.translation'),
          fields: baseTranslationFields(t),
        },
      ],
    };
  }

  if (active === 'collections') {
    return {
      title: t('taxonomy.createCollection'),
      description: t('taxonomy.createCollectionDesc'),
      path: '/catalog/admin/collections',
      method: 'POST',
      submitLabel: t('taxonomy.createCollection'),
      values: { key: '', sortOrder: 0, translations: [{ locale: 'en', name: '', slug: '' }] },
      fields: [
        { name: 'key', label: t('taxonomy.collectionKey'), type: 'text' as const, required: true, width: 'half' as const },
        { name: 'sortOrder', label: t('taxonomy.sortOrder'), type: 'number' as const, min: 0, width: 'half' as const },
        {
          name: 'translations',
          label: t('taxonomy.collectionTranslations'),
          type: 'group-list' as const,
          required: true,
          minItems: 1,
          addLabel: t('catalog.addTranslation'),
          itemLabel: t('catalog.translation'),
          fields: baseTranslationFields(t),
        },
      ],
    };
  }

  if (active === 'product-types') {
    return {
      title: t('taxonomy.createProductType'),
      description: t('taxonomy.createProductTypeDesc'),
      path: '/catalog/admin/product-types',
      method: 'POST',
      submitLabel: t('taxonomy.createProductType'),
      values: {
        key: '',
        sortOrder: 0,
        translations: [{ locale: 'en', name: '', slug: '' }],
        attributes: [],
      },
      fields: [
        { name: 'key', label: t('taxonomy.productTypeKey'), type: 'text' as const, required: true, width: 'half' as const },
        { name: 'sortOrder', label: t('taxonomy.sortOrder'), type: 'number' as const, min: 0, width: 'half' as const },
        {
          name: 'translations',
          label: t('taxonomy.productTypeTranslations'),
          type: 'group-list' as const,
          required: true,
          minItems: 1,
          addLabel: t('catalog.addTranslation'),
          itemLabel: t('catalog.translation'),
          fields: baseTranslationFields(t),
        },
        {
          name: 'attributes',
          label: t('taxonomy.attributeLinks'),
          type: 'group-list' as const,
          addLabel: t('taxonomy.addAttributeLink'),
          itemLabel: t('taxonomy.attributeLink'),
          emptyLabel: t('taxonomy.noAttributesLinked'),
          defaultItem: { attributeId: '', isRequired: false, sortOrder: 0 },
          fields: [
            { name: 'attributeId', label: t('taxonomy.attribute'), type: 'select' as const, required: true, width: 'half' as const, placeholder: t('taxonomy.selectAttribute'), options: attributeOptions },
            { name: 'sortOrder', label: t('taxonomy.sortOrder'), type: 'number' as const, min: 0, width: 'half' as const },
            { name: 'isRequired', label: t('taxonomy.requiredOnProduct'), type: 'switch' as const, width: 'full' as const },
          ],
        },
      ],
    };
  }

  return {
    title: `${t('taxonomy.create')} ${entityLabel}`,
    description: t('taxonomy.createGenericDesc'),
    path: `/catalog/admin/${active}`,
    method: 'POST',
    submitLabel: `${t('taxonomy.create')} ${entityLabel}`,
    values: { key: '', translations: [{ locale: 'en', name: '', slug: '' }] },
    fields: [
      { name: 'key', label: t('taxonomy.key'), type: 'text' as const, required: true, width: 'half' as const },
      {
        name: 'translations',
        label: t('taxonomy.translations'),
        type: 'group-list' as const,
        required: true,
        minItems: 1,
        addLabel: t('catalog.addTranslation'),
        itemLabel: t('catalog.translation'),
        fields: baseTranslationFields(t),
      },
    ],
  };
}

export function TaxonomyPage() {
  const [active, setActive] = useState('brands');
  const { request } = useAuth();
  const { t } = useT();

  const TAXONOMY_TABS = [
    { key: 'brands', label: t('taxonomy.brands') },
    { key: 'categories', label: t('taxonomy.categories') },
    { key: 'collections', label: t('taxonomy.collections') },
    { key: 'tags', label: t('taxonomy.tags') },
    { key: 'attributes', label: t('taxonomy.attributes') },
    { key: 'product-types', label: t('taxonomy.productTypes') },
  ];
  const listing = useQuery({
    queryKey: ['taxonomy', active],
    queryFn: async () => asArray(await request(`/catalog/admin/${active}`)),
  });
  const refData = useQuery({
    queryKey: ['taxonomy', 'refData'],
    queryFn: async () => {
      const [categories, attributes] = await Promise.all([
        asArray(await request('/catalog/admin/categories')),
        asArray(await request('/catalog/admin/attributes')),
      ]);
      return { categories, attributes };
    },
    staleTime: Infinity,
  });
  const create = useActionForm([['taxonomy', active]]);
  const lifecycle = useDirectAction([['taxonomy', active]]);
  const canLifecycle = active !== 'attributes';

  const categoryOptions: ActionOption[] = (refData.data?.categories ?? []).map((c: Record<string, unknown>) => ({
    value: String(c.id),
    label: String(c.name ?? c.key ?? c.id),
  }));
  const attributeOptions: ActionOption[] = (refData.data?.attributes ?? []).map((a: Record<string, unknown>) => ({
    value: String(a.id),
    label: String(a.name ?? a.key ?? a.id),
  }));

  return (
    <PageShell
      title={t('taxonomy.title')}
      subtitle={t('taxonomy.subtitle')}
      actions={
        <button
          className="inline-flex items-center gap-2 border border-neutral-700 bg-white text-black px-4 py-2 font-bold text-xs uppercase tracking-widest hover:bg-neutral-200 transition-colors"
          onClick={() => create.open(createActionFor(t, active, categoryOptions, attributeOptions))}
        >
          <Plus size={16} /> {t('taxonomy.newItem', { item: TAXONOMY_TABS.find(tab => tab.key === active)?.label ?? active.replace('-', ' ') })}
        </button>
      }
    >
      <div className="space-y-4 p-6">
        <Feedback message={create.feedback ?? lifecycle.feedback} />
        <Feedback message={lifecycle.failure} tone="danger" />

        <div className="flex gap-0 border-b border-neutral-800">
          {TAXONOMY_TABS.map((tab) => (
            <button
              key={tab.key}
              onClick={() => setActive(tab.key)}
              className={`px-4 py-2.5 text-sm font-medium transition-colors border-b-2 -mb-[1px] ${
                active === tab.key
                  ? 'border-amber-500 text-amber-400'
                  : 'border-transparent text-neutral-500 hover:text-white hover:border-neutral-700'
              }`}
            >
              {tab.label}
            </button>
          ))}
        </div>

        <div className="space-y-3">
          {listing.isPending && <PageLoading />}
          {listing.isError && <LoadError error={listing.error} />}
          {listing.data && (
            <DataTable headers={[t('common.name'), t('common.status'), '']} empty={!listing.data.length}>
              {listing.data.map((item) => (
                <tr key={item.id}>
                  <td className="px-6 py-3">
                    <strong className="block text-sm">{nameOf(item)}</strong>
                    <small className="block text-xs text-neutral-400">{item.key ?? item.slug ?? item.id}</small>
                  </td>
                  <td className="px-6 py-3">
                    <span className={chipClass(item.status ?? (item.isActive ? 'ACTIVE' : 'DRAFT'))}>
                      {String(item.status ?? (item.isActive ? 'ACTIVE' : 'DRAFT'))}
                    </span>
                  </td>
                  <td className="px-6 py-3">
                    {canLifecycle && (
                      <div className="flex justify-end">
                        <button
                          className={`inline-flex items-center px-3 py-1.5 text-xs font-bold uppercase tracking-widest border transition-colors ${
                            item.status === 'PUBLISHED'
                              ? 'border-red-400/30 text-red-400 hover:bg-red-400/10'
                              : 'border-amber-500/30 text-amber-400 hover:bg-amber-500/10'
                          }`}
                          disabled={lifecycle.pending === item.id}
                          onClick={() =>
                            void lifecycle.run(
                              item.id,
                              `/catalog/admin/${active}/${item.id}/${item.status === 'PUBLISHED' ? 'archive' : 'publish'}`,
                            )
                          }
                        >
                          {item.status === 'PUBLISHED' ? t('catalog.archive') : t('catalog.publish')}
                        </button>
                      </div>
                    )}
                  </td>
                </tr>
              ))}
            </DataTable>
          )}
        </div>
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
