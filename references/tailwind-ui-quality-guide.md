# Tailwind UI Quality Guide

## TOC
- Visual Direction
- Layout and Spacing
- Typography
- Component Craft
- Motion and Feedback
- Accessibility

## Visual Direction
- Define a clear look before coding: neutral, editorial, playful, or product-focused.
- Use a controlled palette with semantic tokens (`--color-bg`, `--color-text`, `--color-accent`).
- Keep shadows, radii, and borders consistent across components.

## Layout and Spacing
- Follow a spacing system (4/8px rhythm) and keep section spacing intentional.
- Use container widths and grid rules consistently across pages.
- Preserve good mobile composition first, then scale up for desktop.

## Typography
- Use a purposeful type scale for headings/body/captions.
- Keep line lengths readable and line-height balanced per text size.
- Use font weight for emphasis before adding extra colors.

## Component Craft
- Standardize button/input/card patterns and reuse them.
- Ensure each component defines default, hover, focus, active, disabled, and loading states.
- Prefer composition and variants over one-off utility piles.

## Motion and Feedback
- Use subtle transitions for interaction and state changes.
- Keep animations short and meaningful; avoid decorative motion noise.
- Always show progress or feedback during async actions.

## Accessibility
- Ensure visible focus rings and keyboard navigation support.
- Meet contrast requirements for text and interactive controls.
- Use semantic HTML and correct ARIA only where needed.
