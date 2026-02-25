# t3stack-fullstack-dev

T3 Stack projelerinde (Next.js + TypeScript) **better-auth, Prisma, tRPC ve Tailwind CSS** ile güvenli, ölçeklenebilir ve kaliteli arayüzler geliştirmek için hazırlanmış bir Codex skill'idir.

Bu skill, özellikle şu hedefler için tasarlanmıştır:
- Fullstack feature geliştirme hızını artırmak
- OWASP Top 10:2025 odaklı güvenlik kontrollerini standartlaştırmak
- Front-end geliştirici kalitesinde Tailwind UI çıktısı üretmek
- GitHub'a çıkacak projelerde kalite kapılarını netleştirmek

## Ne zaman kullanılmalı?

Aşağıdaki görevlerde bu skill tetiklenmelidir:
- Yeni API/procedure geliştirme (tRPC)
- Auth/session/authorization akışlarını düzenleme (better-auth)
- Veri modeli/migration değişiklikleri (Prisma)
- UI ekranı veya component geliştirme (Tailwind)
- Hata düzeltme, refactor, performans iyileştirme
- GitHub release/PR öncesi güvenlik ve kalite kontrolü

## Dahil olan içerikler

- `SKILL.md`
  - Ana çalışma kuralları
  - Uçtan uca geliştirme akışı
  - OWASP Top 10:2025 security gate
  - Tailwind + UI kalite standartları
- `agents/openai.yaml`
  - Codex UI metadata (display name, kısa açıklama, varsayılan prompt)
- `scripts/t3_stack_audit.sh`
  - Projede temel T3 markerlarını hızlı kontrol eder
- `references/t3-implementation-playbook.md`
  - Mimari ve uygulama pattern rehberi
- `references/owasp-2025-security-checklist.md`
  - A01-A10 saldırı kategorilerine karşı kontrol listesi
- `references/tailwind-ui-quality-guide.md`
  - Front-end kalitesinde Tailwind kullanım rehberi
- `references/github-publish-checklist.md`
  - Yayın öncesi kalite/güvenlik checklisti

## Hızlı kullanım

Skill kök dizininde:

```bash
./scripts/t3_stack_audit.sh /path/to/your/project
```

Beklenen çıktı:
- Next.js, TypeScript, tRPC, Prisma, better-auth, Tailwind bağımlılık markerları
- `prisma/schema.prisma` varlık kontrolü

## Geliştirme prensipleri

### 1) Güvenlik varsayılanı
Her değişiklikte OWASP Top 10:2025 kontrolleri zorunludur.

### 2) Tip güvenliği
`any` yerine inferred type, Zod doğrulaması ve tRPC sözleşme disiplini uygulanır.

### 3) Front-end kalite standardı
Sadece çalışan UI değil; görsel hiyerarşi, tutarlı spacing/typography, state tasarımı ve erişilebilirlik hedeflenir.

### 4) Yayın disiplini
PR öncesinde en az şu komutlar geçmelidir:

```bash
npm run lint
npm run typecheck
npm run check
npm run build
```

## Örnek kullanıcı istekleri (trigger örnekleri)

- "tRPC ile protected procedure yaz, sadece kullanıcının kendi kayıtlarını döndürsün."
- "Prisma şemasına yeni relation ekle, migration etkisini de açıkla."
- "Login sonrası dashboard kartlarını Tailwind ile daha modern ve erişilebilir hale getir."
- "Bu feature'ı OWASP Top 10:2025'e göre harden et."
- "PR öncesi güvenlik ve kalite kontrol checklisti uygula."

## GitHub'da yayınlama

Sadece skill klasörünü ayrı repo yapmak için:

```bash
cd /Users/mehmetfiskindal/ersinkucukmuhendislik/skills/public/t3stack-fullstack-dev
git init
git add .
git commit -m "Initial release: t3stack-fullstack-dev"
# sonra remote ekleyip push edin
```

## Lisans

İhtiyacına göre bu klasöre uygun bir `LICENSE` ekleyebilirsin (MIT önerilir).
