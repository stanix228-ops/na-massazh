import React, { useState } from 'react';
import { useTenant } from '../context/TenantContext';
import { getAssetUrl } from '../lib/assets';
import { Camera, X, ArrowsOutSimple } from '@phosphor-icons/react';

export const WorksGallery: React.FC = () => {
  const { tenant } = useTenant();
  const [selectedItem, setSelectedItem] = useState<{ imageUrl: string; caption: string } | null>(null);

  if (!tenant) return null;

  const items = tenant.assets?.galleryItems && tenant.assets.galleryItems.length > 0
    ? tenant.assets.galleryItems
    : (tenant.assets?.gallery || []).map((url, idx) => ({
        id: `legacy-${idx}`,
        imageUrl: url,
        caption: `Фото студии #${idx + 1}`,
        displayOrder: idx,
      }));

  if (items.length === 0) return null;

  return (
    <section className="reveal-section px-4 py-6 max-w-lg mx-auto">
      <div className="flex items-center justify-between mb-3.5">
        <div className="flex items-center gap-2">
          <Camera size={20} weight="bold" className="text-white" />
          <h3 className="text-lg font-serif font-bold text-white tracking-tight">
            Фотогалерея и атмосфера студии
          </h3>
        </div>
        <span className="text-xs text-[#8E8E93]">
          {items.length} фото
        </span>
      </div>

      <div className="grid grid-cols-2 sm:grid-cols-3 gap-2.5 sm:gap-3">
        {items.map((item) => (
          <button
            type="button"
            key={item.id}
            onClick={() => setSelectedItem({ imageUrl: item.imageUrl, caption: item.caption })}
            className="group relative text-left rounded-2xl overflow-hidden border border-white/10 bg-[#0D0D11] shadow-lg transition-all hover:border-white/30 cursor-pointer focus:outline-none"
          >
            <div className="relative aspect-[4/3] w-full overflow-hidden bg-neutral-950">
              <img
                src={getAssetUrl(item.imageUrl)}
                alt={item.caption}
                className="w-full h-full object-cover object-center group-hover:scale-105 transition-transform duration-500"
                loading="lazy"
              />
              <div className="absolute top-2 right-2 w-6 h-6 rounded-full bg-black/60 backdrop-blur-md border border-white/15 flex items-center justify-center opacity-0 group-hover:opacity-100 transition-opacity">
                <ArrowsOutSimple size={12} className="text-white" />
              </div>
            </div>
            <div className="p-2.5 bg-black/70 backdrop-blur-md border-t border-white/10">
              <p className="text-[11px] font-medium text-neutral-200 line-clamp-1">
                {item.caption}
              </p>
            </div>
          </button>
        ))}
      </div>

      {/* Lightbox Modal for full-size photo / price board inspection */}
      {selectedItem && (
        <div
          className="fixed inset-0 z-50 bg-black/90 backdrop-blur-xl flex items-center justify-center p-4 animate-in fade-in duration-200"
          onClick={() => setSelectedItem(null)}
        >
          <div
            className="relative max-w-lg w-full bg-[#0D0D11] border border-white/15 rounded-3xl overflow-hidden shadow-2xl"
            onClick={(e) => e.stopPropagation()}
          >
            <button
              type="button"
              onClick={() => setSelectedItem(null)}
              className="absolute top-3 right-3 z-10 w-9 h-9 rounded-full bg-black/70 hover:bg-black text-white border border-white/20 flex items-center justify-center cursor-pointer transition-colors"
              aria-label="Закрыть фото"
            >
              <X size={18} weight="bold" />
            </button>
            <div className="max-h-[75vh] overflow-auto bg-black flex items-center justify-center">
              <img
                src={getAssetUrl(selectedItem.imageUrl)}
                alt={selectedItem.caption}
                className="w-full h-auto max-h-[75vh] object-contain"
              />
            </div>
            <div className="p-4 border-t border-white/10 bg-[#0D0D11] text-center">
              <p className="text-xs sm:text-sm font-medium text-white">
                {selectedItem.caption}
              </p>
            </div>
          </div>
        </div>
      )}
    </section>
  );
};
