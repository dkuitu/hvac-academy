# HVAC Academy

An automated educational content platform focused on HVAC (Heating, Ventilation, and Air Conditioning) topics. The site features AI-generated educational articles, a hashtag organization system, HVAC calculators, and is optimized for maximum AdSense revenue with minimal maintenance.

![HVAC Academy Screenshot](https://via.placeholder.com/1200x630?text=HVAC+Academy)

## 📋 Project Overview

HVAC Academy is a content farm targeting HVAC professionals and enthusiasts. Unlike typical news aggregation sites, it focuses on evergreen educational content automatically generated on a scheduled basis. This approach significantly reduces maintenance needs while maximizing long-term SEO value and ad revenue.

### ✨ Key Features

- **Automated Content Generation**: Weekly educational articles created by DeepSeek AI
- **HVAC Calculators**: Interactive tools for professionals (load calculations, duct sizing, etc.)
- **Hashtag System**: Content organization via hashtags for intuitive navigation
- **SEO Optimization**: Structured content for maximum search visibility
- **AdSense Integration**: Strategic ad placements for revenue optimization
- **Low Maintenance**: Fully automated publishing requiring minimal oversight

## 🏗️ Architecture

### System Architecture

```
┌────────────────────┐           ┌────────────────────┐
│                    │           │                    │
│   Frontend         │◄─────────►│   Next.js API      │
│   (Next.js)        │           │   (Backend)        │
│                    │           │                    │
└─────────┬──────────┘           └─────────┬──────────┘
          │                                 │
          │                                 │
          │                                 ▼
          │                       ┌────────────────────┐
          │                       │                    │
          │                       │   MongoDB          │
          │                       │   (Database)       │
          │                       │                    │
          │                       └────────────────────┘
          │
          │                       ┌────────────────────┐
          │                       │                    │
          └──────────────────────►│   Vercel           │
                                  │   (Hosting)        │
                                  │                    │
                                  └────────────────────┘
```

### External Services

```
┌────────────────────┐           ┌────────────────────┐
│                    │           │                    │
│   DeepSeek API     │◄─────────►│   Content          │
│   (Content         │           │   Generation       │
│    Generation)     │           │   Script           │
│                    │           │                    │
└────────────────────┘           └────────────────────┘
                                           ▲
                                           │
┌────────────────────┐                     │
│                    │                     │
│   Unsplash API     │─────────────────────┘
│   (Images)         │                    
│                    │                    
└────────────────────┘                    

┌────────────────────┐           ┌────────────────────┐
│                    │           │                    │
│   GitHub Actions   │──────────►│   Scheduled        │
│   (Automation)     │           │   Publication      │
│                    │           │                    │
└────────────────────┘           └────────────────────┘
```

### Technology Stack

- **Frontend**: Next.js + Tailwind CSS
- **Backend**: Next.js API Routes
- **Database**: MongoDB
- **Content Generation**: DeepSeek AI API
- **Images**: Unsplash API
- **Deployment**: Vercel
- **Automation**: GitHub Actions
- **Monetization**: Google AdSense

## 📁 Project Structure

```
hvac-academy/
│
├── components/             # UI components
│   ├── Layout.jsx
│   ├── Header.jsx
│   ├── Footer.jsx
│   ├── ArticleCard.jsx
│   ├── TagCloud.jsx
│   └── ads/                # AdSense components
│       ├── HeaderAd.jsx
│       ├── SidebarAd.jsx
│       └── InContentAd.jsx
│
├── lib/                    # Core utilities and models
│   ├── mongodb.js          # Database connection
│   ├── constants.js        # App constants
│   └── models/             # Mongoose models
│       ├── Article.js
│       └── Tag.js
│
├── pages/                  # Next.js pages and API routes
│   ├── index.js            # Homepage
│   ├── articles/           # Article pages
│   │   ├── index.js        # Article listing
│   │   └── [slug].js       # Single article page
│   ├── calculators/        # Calculator pages
│   │   ├── index.js
│   │   ├── hvac-load.js
│   │   └── duct-sizing.js
│   ├── tags/               # Tag pages
│   │   ├── index.js
│   │   └── [tag].js
│   └── api/                # API routes
│       ├── articles/
│       │   ├── index.js
│       │   └── [slug].js
│       └── tags/
│           └── index.js
│
├── public/                 # Static assets
│   ├── favicon.ico
│   └── images/
│
├── scripts/                # Automated scripts
│   └── generate-article.js # Content generation script
│
├── styles/                 # Global styles
│   └── globals.css
│
├── .env.local              # Environment variables (gitignored)
├── .gitignore
├── next.config.js
├── package.json
├── README.md
└── tailwind.config.js
```

## 🔄 Content Flow

1. **Content Generation**:
   - Weekly GitHub Action triggers the article generation script
   - Script selects the next category in rotation (Maintenance → Installation → Troubleshooting → Technology → History)
   - DeepSeek API generates educational content based on category-specific prompts
   - Unsplash API provides a relevant image
   - Content and metadata are stored in MongoDB

2. **Content Delivery**:
   - Next.js frontend fetches articles from the database
   - Articles are displayed with proper formatting and related hashtags
   - Article views increment the view counter
   - Tags are automatically tracked and weighted by usage

3. **Monetization**:
   - Strategic ad placements throughout the site
   - Header, sidebar, in-content, and footer ad units
   - Optimized for maximum viewability and CTR

## 🔧 Core Features Detailed

### Automated Content Generation

The system automatically generates new educational HVAC articles weekly through GitHub Actions. Content is produced using the DeepSeek AI API with specific prompts for each category, ensuring variety and comprehensive coverage of HVAC topics.

### Hashtag System

Articles are automatically tagged with relevant hashtags during generation. The system tracks tag usage and relationships, allowing users to explore related content easily. The tag cloud displays popular topics weighted by frequency.

### HVAC Calculators

Interactive tools designed for HVAC professionals and homeowners:
- **HVAC Load Calculator**: Determine cooling/heating capacity requirements
- **Duct Sizing Calculator**: Calculate proper duct dimensions
- **Efficiency Savings Calculator**: Estimate ROI on equipment upgrades

### SEO Optimization

- Structured content with proper heading hierarchy
- Keyword-rich URLs using article slugs
- Meta tags customized for each page
- Schema.org markup for articles
- XML sitemap generation
- Canonical URLs to prevent duplicate content

### AdSense Integration

Strategic ad placement to maximize revenue while maintaining good user experience:
- Header banner (728×90)
- In-content ads after introduction
- Sidebar display (300×250 or 300×600)
- Footer responsive units

## 🚀 Getting Started

### Prerequisites

- Node.js (v14+)
- MongoDB instance (Atlas recommended)
- DeepSeek API account
- Unsplash API account
- Google AdSense account

### Environment Variables

Create a `.env.local` file with:

```
MONGODB_URI=your_mongodb_connection_string
DEEPSEEK_API_KEY=your_deepseek_api_key
UNSPLASH_API_KEY=your_unsplash_api_key
```

### Installation

```bash
# Clone the repository
git clone https://github.com/yourusername/hvac-academy.git
cd hvac-academy

# Install dependencies
npm install

# Run development server
npm run dev
```

### Deployment to Vercel

```bash
# Install Vercel CLI
npm i -g vercel

# Deploy
vercel
```

## 💰 Monetization Strategy

1. **Google AdSense**:
   - Primary revenue source through strategic ad placements
   - Optimization for HVAC industry CPCs (typically $2-5)
   - A/B testing different ad formats and placements

2. **Affiliate Marketing** (future expansion):
   - Amazon Associates links to HVAC equipment
   - HVAC manufacturer affiliate programs
   - HVAC training course referrals

3. **Sponsored Calculators** (future expansion):
   - Branded calculator tools sponsored by HVAC companies
   - Lead generation for HVAC contractors

## 📊 Maintenance & Monitoring

The site is designed for minimal maintenance:

- **Weekly**: Automated content generation (no manual intervention)
- **Monthly**: Quick check of site health and ad performance (15 minutes)
- **Quarterly**: Review of content quality and calculator accuracy (1 hour)
- **Annual**: API key renewals and technology stack updates (2-3 hours)

Monitoring is handled through:
- Google Analytics for user behavior
- Google Search Console for SEO performance
- AdSense dashboard for revenue tracking
- Uptime robot for availability monitoring

## 📝 License

This project is licensed under the MIT License - see the LICENSE file for details.# hvac-academy
