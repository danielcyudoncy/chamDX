---
name: Pan-African PropTech Prestige
colors:
  surface: '#fbf8fd'
  surface-dim: '#dbd9de'
  surface-bright: '#fbf8fd'
  surface-container-lowest: '#ffffff'
  surface-container-low: '#f5f2f8'
  surface-container: '#efedf2'
  surface-container-high: '#eae7ec'
  surface-container-highest: '#e4e1e7'
  on-surface: '#1b1b1f'
  on-surface-variant: '#45464f'
  inverse-surface: '#303034'
  inverse-on-surface: '#f2f0f5'
  outline: '#767680'
  outline-variant: '#c6c5d0'
  surface-tint: '#505b90'
  primary: '#061447'
  on-primary: '#ffffff'
  primary-container: '#1e2a5c'
  on-primary-container: '#8792cb'
  inverse-primary: '#b8c3ff'
  secondary: '#006c49'
  on-secondary: '#ffffff'
  secondary-container: '#6cf8bb'
  on-secondary-container: '#00714d'
  tertiary: '#271500'
  on-tertiary: '#ffffff'
  tertiary-container: '#432800'
  on-tertiary-container: '#d08500'
  error: '#ba1a1a'
  on-error: '#ffffff'
  error-container: '#ffdad6'
  on-error-container: '#93000a'
  primary-fixed: '#dde1ff'
  primary-fixed-dim: '#b8c3ff'
  on-primary-fixed: '#091649'
  on-primary-fixed-variant: '#384377'
  secondary-fixed: '#6ffbbe'
  secondary-fixed-dim: '#4edea3'
  on-secondary-fixed: '#002113'
  on-secondary-fixed-variant: '#005236'
  tertiary-fixed: '#ffddb8'
  tertiary-fixed-dim: '#ffb95f'
  on-tertiary-fixed: '#2a1700'
  on-tertiary-fixed-variant: '#653e00'
  background: '#fbf8fd'
  on-background: '#1b1b1f'
  surface-variant: '#e4e1e7'
typography:
  display-lg:
    fontFamily: Plus Jakarta Sans
    fontSize: 48px
    fontWeight: '700'
    lineHeight: '1.1'
    letterSpacing: -0.02em
  headline-lg:
    fontFamily: Plus Jakarta Sans
    fontSize: 32px
    fontWeight: '700'
    lineHeight: '1.2'
  headline-lg-mobile:
    fontFamily: Plus Jakarta Sans
    fontSize: 28px
    fontWeight: '700'
    lineHeight: '1.2'
  headline-md:
    fontFamily: Plus Jakarta Sans
    fontSize: 24px
    fontWeight: '600'
    lineHeight: '1.3'
  title-lg:
    fontFamily: Plus Jakarta Sans
    fontSize: 20px
    fontWeight: '600'
    lineHeight: '1.4'
  body-lg:
    fontFamily: Plus Jakarta Sans
    fontSize: 18px
    fontWeight: '400'
    lineHeight: '1.6'
  body-md:
    fontFamily: Plus Jakarta Sans
    fontSize: 16px
    fontWeight: '400'
    lineHeight: '1.6'
  label-md:
    fontFamily: Plus Jakarta Sans
    fontSize: 14px
    fontWeight: '500'
    lineHeight: '1.2'
    letterSpacing: 0.01em
  label-sm:
    fontFamily: Plus Jakarta Sans
    fontSize: 12px
    fontWeight: '600'
    lineHeight: '1.2'
rounded:
  sm: 0.25rem
  DEFAULT: 0.5rem
  md: 0.75rem
  lg: 1rem
  xl: 1.5rem
  full: 9999px
spacing:
  base: 8px
  xs: 4px
  sm: 12px
  md: 24px
  lg: 40px
  xl: 64px
  gutter: 24px
  margin-mobile: 16px
  margin-desktop: 48px
---

## Brand & Style

This design system is engineered to evoke a sense of security, exclusivity, and seamless modern living for residents of gated communities across Africa. The aesthetic is a hybrid of **Glassmorphism** and **Modern Corporate**, balancing the "high-tech" allure of transparent, layered interfaces with the "high-trust" stability of flat, structured layouts.

The visual narrative focuses on "Digital Stewardship"—using clean, spacious environments and premium glass effects to make complex property management tasks feel effortless. The target audience includes tech-savvy residents, estate managers, and security personnel who require clarity, speed, and a premium experience that reflects their environment.

## Colors

The palette is anchored by **Deep Navy (#1E2A5C)**, representing authority and institutional trust. This is contrasted with a vibrant **Emerald Green** for success states and resident "amenity" interactions, while **Amber** and **Red** are reserved for critical estate alerts and emergency response features.

The "Soft Gray" backgrounds utilize a cool-toned slate to maintain a premium SaaS feel. In **Dark Mode**, the system shifts to a deep navy-tinted charcoal, ensuring that glass effects maintain their luminosity and depth without causing eye strain during night-time security checks or evening resident access.

## Typography

**Plus Jakarta Sans** is the sole typeface for the design system. Its modern, slightly rounded geometric structure provides high legibility while appearing sophisticated and inviting.

To maintain the "Modern SaaS" aesthetic, typography utilizes generous leading (line height) to ensure data-heavy estate management screens remain breathable. Large display headings are reserved for dashboard overviews, while labels and small text layers use medium to semi-bold weights to ensure they remain legible when placed over translucent glass elements.

## Layout & Spacing

The design system employs a **12-column fluid grid** for desktop and a **4-column grid** for mobile. The layout philosophy is "spacious and intentional," utilizing an 8px base unit to drive all padding and margin decisions.

To achieve the premium feel, "whitespace" is treated as a core design element rather than empty space. Containers should have a minimum internal padding of `24px` (md) to prevent content from feeling crowded. On mobile, margins are tightened to `16px`, but vertical rhythm is maintained with consistent `24px` spacing between functional blocks.

## Elevation & Depth

Visual hierarchy is established through a combination of **Ambient Shadows** and **Backdrop Blurs**.

1.  **Level 0 (Floor):** The base background, utilizing the neutral slate or dark mode charcoal.
2.  **Level 1 (Cards):** Subtle white (or dark navy) surfaces with a 1px low-opacity border.
3.  **Level 2 (Glass Layers):** Elements that "float" above the floor using `backdrop-filter: blur(12px)`. These elements use a semi-transparent white (or navy) fill with a 10% opacity white inner border to simulate a glass edge.
4.  **Level 3 (Overlays):** Modals and dropdowns use extra-diffused shadows (`0 20px 50px rgba(0,0,0,0.1)`) and high-strength blurs to create focus and isolate interaction from the background noise.

## Shapes

The shape language is consistently **Rounded**, signifying approachability and modern design trends. 

- **Standard Elements (Buttons, Inputs):** Use a `0.5rem` (8px) radius.
- **Surface Containers (Cards, Modals):** Use `1rem` (16px) radius for `rounded-lg` and `1.5rem` (24px) for `rounded-xl` to create a soft, nested appearance. 
- **Icons:** Should always be placed within circular or highly rounded containers to maintain the visual flow of the gated community aesthetic.

## Components

### Glass Cards
The signature component of this design system. Cards use a 40% opacity background with a `12px` backdrop blur and a `1px` stroke (white at 15% opacity). They should have a subtle drop shadow to lift them from the background.

### Premium Buttons
Primary buttons use the Deep Navy (#1E2A5C) with white text. Success or Emergency buttons use the full-color Emerald or Red fills. All buttons feature a `0.5rem` corner radius and medium-weight labels.

### Input Fields
Inputs are flat with a light-gray border in their default state, but transition to a subtle glow (using the primary navy) and a slightly thicker border on focus. Labels should be floating or placed clearly above the field in `label-md` style.

### Status Chips
Used for visitor status (e.g., "Expected," "Checked In"). These use the primary or secondary colors at 10% opacity for the background and 100% opacity for the text, creating a modern, high-contrast look that is easy to scan.

### List Items
For directories or activity logs, use spacious horizontal rows with a `1px` bottom border. Each item should have a clear leading icon or avatar to aid recognition at a glance.
