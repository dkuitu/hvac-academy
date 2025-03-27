# HVAC Academy Build Task

## Project Overview

HVAC Academy is an educational content farm focused on HVAC (Heating, Ventilation, and Air Conditioning) topics. The site will feature automatically generated educational articles about HVAC concepts, tips, technologies, history, and troubleshooting. It will be optimized for Google AdSense revenue and designed to be extremely low maintenance.

### Key Features

1. **Automated Content Generation**: Weekly articles created by DeepSeek AI on various HVAC educational topics
2. **Hashtag System**: Content categorized with hashtags for easy navigation
3. **HVAC Calculators**: Simple tools for HVAC professionals (Load Calculator, Duct Sizing, etc.)
4. **SEO Optimization**: Well-structured content designed for search engine visibility
5. **AdSense Integration**: Strategic ad placements to maximize revenue
6. **Low Maintenance**: Fully automated publishing system requiring minimal oversight

## Technology Stack

- **Frontend**: Next.js with Tailwind CSS
- **Backend**: Next.js API routes + Serverless functions
- **Database**: MongoDB
- **Hosting**: Vercel
- **Content Generation**: DeepSeek API
- **Images**: Unsplash API
- **Scheduling**: GitHub Actions
- **Monetization**: Google AdSense

## Detailed Implementation Steps

### 1. Project Setup

1.1. Initialize a new Next.js project with Tailwind CSS:

```bash
npx create-next-app@latest hvac-academy
cd hvac-academy
npm install -D tailwindcss postcss autoprefixer
npx tailwindcss init -p
```

1.2. Configure Tailwind CSS:

```js
// tailwind.config.js
module.exports = {
  content: [
    './pages/**/*.{js,ts,jsx,tsx,mdx}',
    './components/**/*.{js,ts,jsx,tsx,mdx}',
    './app/**/*.{js,ts,jsx,tsx,mdx}',
  ],
  theme: {
    extend: {},
  },
  plugins: [],
}
```

1.3. Install additional dependencies:

```bash
npm install mongoose axios date-fns slugify
```

### 2. Database Setup

2.1. Create database models in `/lib/models/`:

```js
// lib/models/Article.js
import mongoose from 'mongoose';

const ArticleSchema = new mongoose.Schema({
  title: {
    type: String,
    required: true,
  },
  content: {
    type: String,
    required: true,
  },
  slug: {
    type: String,
    required: true,
    unique: true,
  },
  imageUrl: {
    type: String,
    required: true,
  },
  category: {
    type: String,
    required: true,
  },
  hashtags: [{
    type: String
  }],
  publishedDate: {
    type: Date,
    default: Date.now
  },
  viewCount: {
    type: Number,
    default: 0
  }
});

export default mongoose.models.Article || mongoose.model('Article', ArticleSchema);
```

```js
// lib/models/Tag.js
import mongoose from 'mongoose';

const TagSchema = new mongoose.Schema({
  name: {
    type: String,
    required: true,
    unique: true,
  },
  count: {
    type: Number,
    default: 1
  },
  relatedTags: [{
    type: String
  }]
});

export default mongoose.models.Tag || mongoose.model('Tag', TagSchema);
```

2.2. Create MongoDB connection utility:

```js
// lib/mongodb.js
import mongoose from 'mongoose';

const MONGODB_URI = process.env.MONGODB_URI;

if (!MONGODB_URI) {
  throw new Error('Please define the MONGODB_URI environment variable');
}

let cached = global.mongoose;

if (!cached) {
  cached = global.mongoose = { conn: null, promise: null };
}

async function dbConnect() {
  if (cached.conn) {
    return cached.conn;
  }

  if (!cached.promise) {
    const opts = {
      bufferCommands: false,
    };

    cached.promise = mongoose.connect(MONGODB_URI, opts).then((mongoose) => {
      return mongoose;
    });
  }
  cached.conn = await cached.promise;
  return cached.conn;
}

export default dbConnect;
```

### 3. Content Generation System

3.1. Create constants for content categories:

```js
// lib/constants.js
export const CONTENT_CATEGORIES = [
  {
    name: 'Maintenance',
    hashtags: ['#Maintenance', '#SeasonalCare', '#Efficiency', '#BestPractices']
  },
  {
    name: 'Installation',
    hashtags: ['#Installation', '#Sizing', '#Ductwork', '#Planning']
  },
  {
    name: 'Troubleshooting',
    hashtags: ['#Troubleshooting', '#DIY', '#CommonIssues', '#Diagnosis']
  },
  {
    name: 'Technology',
    hashtags: ['#Technology', '#SmartHome', '#Innovation', '#Controls']
  },
  {
    name: 'History',
    hashtags: ['#History', '#Innovations', '#Timeline', '#Development']
  }
];

export const CATEGORY_PROMPTS = {
  'Maintenance': 'Create a comprehensive HVAC maintenance guide covering seasonal maintenance tasks, best practices, and efficiency tips.',
  'Installation': 'Write an educational article about proper HVAC installation considerations, sizing guidelines, and common mistakes to avoid.',
  'Troubleshooting': 'Create a troubleshooting guide for common HVAC problems, including step-by-step diagnosis instructions and potential DIY fixes.',
  'Technology': 'Write an in-depth explanation of modern HVAC technology innovations, including smart thermostats, variable speed systems, and their benefits.',
  'History': 'Create an educational timeline of HVAC history, from early cooling and heating methods to modern systems, highlighting key innovations.'
};
```

3.2. Create article generation utility:

```js
// scripts/generate-article.js
require('dotenv').config();
const axios = require('axios');
const slugify = require('slugify');
const mongoose = require('mongoose');
const fs = require('fs');
const path = require('path');

// Load models
const ArticleSchema = new mongoose.Schema({
  title: String,
  content: String,
  slug: String,
  imageUrl: String,
  category: String,
  hashtags: [String],
  publishedDate: Date,
  viewCount: Number
});

const TagSchema = new mongoose.Schema({
  name: String,
  count: Number,
  relatedTags: [String]
});

// Connect to MongoDB
mongoose.connect(process.env.MONGODB_URI)
  .then(() => console.log('MongoDB connected'))
  .catch(err => console.error('MongoDB connection error:', err));

const Article = mongoose.models.Article || mongoose.model('Article', ArticleSchema);
const Tag = mongoose.models.Tag || mongoose.model('Tag', TagSchema);

// Content categories
const CONTENT_CATEGORIES = [
  {
    name: 'Maintenance',
    hashtags: ['#Maintenance', '#SeasonalCare', '#Efficiency', '#BestPractices']
  },
  {
    name: 'Installation',
    hashtags: ['#Installation', '#Sizing', '#Ductwork', '#Planning']
  },
  {
    name: 'Troubleshooting',
    hashtags: ['#Troubleshooting', '#DIY', '#CommonIssues', '#Diagnosis']
  },
  {
    name: 'Technology',
    hashtags: ['#Technology', '#SmartHome', '#Innovation', '#Controls']
  },
  {
    name: 'History',
    hashtags: ['#History', '#Innovations', '#Timeline', '#Development']
  }
];

const CATEGORY_PROMPTS = {
  'Maintenance': 'Create a comprehensive HVAC maintenance guide covering seasonal maintenance tasks, best practices, and efficiency tips.',
  'Installation': 'Write an educational article about proper HVAC installation considerations, sizing guidelines, and common mistakes to avoid.',
  'Troubleshooting': 'Create a troubleshooting guide for common HVAC problems, including step-by-step diagnosis instructions and potential DIY fixes.',
  'Technology': 'Write an in-depth explanation of modern HVAC technology innovations, including smart thermostats, variable speed systems, and their benefits.',
  'History': 'Create an educational timeline of HVAC history, from early cooling and heating methods to modern systems, highlighting key innovations.'
};

// Extract title from generated content
function extractTitle(content) {
  const lines = content.split('\n');
  for (const line of lines) {
    const trimmedLine = line.trim();
    if (trimmedLine.startsWith('# ')) {
      return trimmedLine.substring(2);
    }
    if (trimmedLine.startsWith('#')) {
      return trimmedLine.substring(1).trim();
    }
  }
  
  // If no explicit title found, use the first line
  return lines[0].trim();
}

// Get image for category
async function getImageForCategory(category) {
  const searchTerms = {
    'Maintenance': 'hvac maintenance',
    'Installation': 'hvac installation',
    'Troubleshooting': 'air conditioner repair',
    'Technology': 'smart thermostat technology',
    'History': 'vintage air conditioner'
  };
  
  const term = searchTerms[category] || 'hvac system';
  
  try {
    const response = await axios.get(`https://api.unsplash.com/photos/random?query=${term}&client_id=${process.env.UNSPLASH_API_KEY}`);
    return response.data.urls.regular;
  } catch (error) {
    console.error('Error fetching image:', error);
    // Fallback to placeholder
    return `https://via.placeholder.com/800x450?text=HVAC+${category}`;
  }
}

// Generate an article
async function generateArticle() {
  try {
    // Get the latest article to determine which category to use next
    const latestArticle = await Article.findOne().sort({ publishedDate: -1 });
    
    // Determine which category to use
    let categoryIndex = 0;
    if (latestArticle) {
      const lastCategory = latestArticle.category;
      const lastIndex = CONTENT_CATEGORIES.findIndex(c => c.name === lastCategory);
      categoryIndex = (lastIndex + 1) % CONTENT_CATEGORIES.length;
    }
    
    const category = CONTENT_CATEGORIES[categoryIndex].name;
    const hashtags = CONTENT_CATEGORIES[categoryIndex].hashtags;
    const prompt = CATEGORY_PROMPTS[category];
    
    console.log(`Generating article for category: ${category}`);
    
    // Call DeepSeek API
    const systemPrompt = `
      You are an expert HVAC educator writing clear, informative articles for both professionals and homeowners.
      Your content should be educational, precise, and provide practical value.
      Structure your content with clear headings, bullet points where appropriate, and a logical flow.
      Include practical examples and avoid technical jargon unless necessary and explained.
    `;
    
    const response = await axios.post('https://api.deepseek.com/v1/chat/completions', {
      model: "deepseek-chat",
      messages: [
        { role: "system", content: systemPrompt },
        { role: "user", content: prompt }
      ],
      temperature: 0.7,
      max_tokens: 2000
    }, {
      headers: {
        'Authorization': `Bearer ${process.env.DEEPSEEK_API_KEY}`,
        'Content-Type': 'application/json'
      }
    });
    
    const articleContent = response.data.choices[0].message.content;
    const title = extractTitle(articleContent);
    const slug = slugify(title, { lower: true, strict: true });
    
    // Get image
    const imageUrl = await getImageForCategory(category);
    
    // Save article to database
    const article = new Article({
      title,
      content: articleContent,
      slug,
      imageUrl,
      category,
      hashtags,
      publishedDate: new Date(),
      viewCount: 0
    });
    
    await article.save();
    console.log(`Article saved: ${title}`);
    
    // Update tag counts
    for (const tag of hashtags) {
      const existingTag = await Tag.findOne({ name: tag });
      if (existingTag) {
        existingTag.count += 1;
        await existingTag.save();
      } else {
        const newTag = new Tag({
          name: tag,
          count: 1,
          relatedTags: hashtags.filter(t => t !== tag)
        });
        await newTag.save();
      }
    }
    
    console.log('Tags updated');
    
    // Disconnect from MongoDB
    await mongoose.disconnect();
    console.log('Done');
    
  } catch (error) {
    console.error('Error generating article:', error);
    process.exit(1);
  }
}

// Run the function
generateArticle();
```

3.3. Create GitHub Actions workflow:

```yaml
# .github/workflows/generate-content.yml
name: Weekly HVAC Content Generation

on:
  schedule:
    - cron: '0 12 * * MON' # Runs every Monday at 12:00 UTC
  workflow_dispatch: # Allow manual trigger

jobs:
  generate-content:
    runs-on: ubuntu-latest
    steps:
      - uses: actions/checkout@v3
      - uses: actions/setup-node@v3
        with:
          node-version: '18'
      
      - name: Install dependencies
        run: npm ci
      
      - name: Generate new article
        run: node scripts/generate-article.js
        env:
          DEEPSEEK_API_KEY: ${{ secrets.DEEPSEEK_API_KEY }}
          UNSPLASH_API_KEY: ${{ secrets.UNSPLASH_API_KEY }}
          MONGODB_URI: ${{ secrets.MONGODB_URI }}
```

### 4. Frontend Implementation

4.1. Create layout components:

```jsx
// components/Layout.jsx
import Head from 'next/head';
import Header from './Header';
import Footer from './Footer';

export default function Layout({ children, title = 'HVAC Academy', description = 'Educational resources for HVAC professionals and enthusiasts' }) {
  return (
    <div className="min-h-screen flex flex-col bg-gray-50">
      <Head>
        <title>{title}</title>
        <meta name="description" content={description} />
        <meta name="viewport" content="width=device-width, initial-scale=1" />
        <link rel="icon" href="/favicon.ico" />
      </Head>
      
      <Header />
      
      <main className="container mx-auto flex-grow p-4">
        {children}
      </main>
      
      <Footer />
    </div>
  );
}
```

```jsx
// components/Header.jsx
import Link from 'next/link';
import { useState } from 'react';

export default function Header() {
  const [isMenuOpen, setIsMenuOpen] = useState(false);
  
  return (
    <header className="bg-blue-600 text-white">
      <div className="container mx-auto py-4 px-4">
        <div className="flex justify-between items-center">
          <Link href="/" className="font-bold text-2xl">
            HVAC Academy
          </Link>
          
          <button 
            className="md:hidden"
            onClick={() => setIsMenuOpen(!isMenuOpen)}
          >
            <svg className="w-6 h-6" fill="none" stroke="currentColor" viewBox="0 0 24 24" xmlns="http://www.w3.org/2000/svg">
              <path strokeLinecap="round" strokeLinejoin="round" strokeWidth="2" d="M4 6h16M4 12h16M4 18h16"></path>
            </svg>
          </button>
          
          <nav className={`${isMenuOpen ? 'block' : 'hidden'} md:block md:flex md:space-x-6 absolute md:static top-16 left-0 right-0 bg-blue-600 md:bg-transparent p-4 md:p-0 z-50`}>
            <Link href="/" className="block py-2 md:py-0 hover:text-blue-200">
              Home
            </Link>
            <Link href="/articles" className="block py-2 md:py-0 hover:text-blue-200">
              Articles
            </Link>
            <Link href="/calculators" className="block py-2 md:py-0 hover:text-blue-200">
              Calculators
            </Link>
            <Link href="/tags" className="block py-2 md:py-0 hover:text-blue-200">
              Tags
            </Link>
          </nav>
        </div>
      </div>
    </header>
  );
}
```

```jsx
// components/Footer.jsx
import Link from 'next/link';

export default function Footer() {
  return (
    <footer className="bg-gray-800 text-gray-300 mt-auto">
      <div className="container mx-auto py-6 px-4">
        <div className="text-center">
          <p className="mb-2">© {new Date().getFullYear()} HVAC Academy. Educational resources for HVAC professionals.</p>
          <div className="flex justify-center space-x-4">
            <Link href="/privacy" className="text-gray-400 hover:text-white">
              Privacy Policy
            </Link>
            <Link href="/terms" className="text-gray-400 hover:text-white">
              Terms of Use
            </Link>
            <Link href="/contact" className="text-gray-400 hover:text-white">
              Contact
            </Link>
          </div>
        </div>
      </div>
    </footer>
  );
}
```

4.2. Create components for articles:

```jsx
// components/ArticleCard.jsx
import Link from 'next/link';
import Image from 'next/image';

export default function ArticleCard({ article }) {
  return (
    <div className="bg-white rounded-lg shadow-md overflow-hidden">
      <div className="h-48 relative">
        <Image 
          src={article.imageUrl} 
          alt={article.title} 
          fill 
          sizes="(max-width: 768px) 100vw, (max-width: 1200px) 50vw, 33vw"
          className="object-cover"
        />
      </div>
      <div className="p-4">
        <div className="flex flex-wrap gap-2 mb-2">
          {article.hashtags.slice(0, 2).map((tag) => (
            <Link 
              href={`/tags/${tag.replace('#', '')}`}
              key={tag}
              className="bg-blue-100 text-blue-800 px-2 py-1 rounded-full text-xs"
            >
              {tag}
            </Link>
          ))}
        </div>
        <h2 className="text-xl font-bold mb-2">{article.title}</h2>
        <p className="text-gray-600 mb-3">
          {article.content.substring(0, 120).replace(/#.*?\n/g, '')}...
        </p>
        <Link 
          href={`/articles/${article.slug}`}
          className="text-blue-600 hover:underline"
        >
          Read Full Guide →
        </Link>
      </div>
    </div>
  );
}
```

```jsx
// components/TagCloud.jsx
import Link from 'next/link';

export default function TagCloud({ tags }) {
  return (
    <div className="flex flex-wrap gap-3">
      {tags.map((tag) => (
        <Link 
          href={`/tags/${tag.name.replace('#', '')}`}
          key={tag.name}
          className="bg-blue-100 hover:bg-blue-200 text-blue-800 px-3 py-2 rounded-full"
        >
          {tag.name} ({tag.count})
        </Link>
      ))}
    </div>
  );
}
```

4.3. Create Ad components:

```jsx
// components/ads/HeaderAd.jsx
export default function HeaderAd() {
  return (
    <div className="bg-gray-100 border border-dashed border-gray-300 rounded-lg p-2 mb-6 text-center h-24 flex items-center justify-center text-gray-400">
      <div id="header-ad">
        <script async src="https://pagead2.googlesyndication.com/pagead/js/adsbygoogle.js?client=ca-pub-XXXXXXXXXXXXXXXX" crossOrigin="anonymous"></script>
        <ins className="adsbygoogle"
             style={{ display: 'block' }}
             data-ad-client="ca-pub-XXXXXXXXXXXXXXXX"
             data-ad-slot="XXXXXXXXXX"
             data-ad-format="auto"
             data-full-width-responsive="true"></ins>
        <script>
            (adsbygoogle = window.adsbygoogle || []).push({});
        </script>
      </div>
    </div>
  );
}
```

```jsx
// components/ads/SidebarAd.jsx
export default function SidebarAd() {
  return (
    <div className="bg-gray-100 border border-dashed border-gray-300 rounded-lg flex items-center justify-center text-gray-400 h-64">
      <div id="sidebar-ad">
        <script async src="https://pagead2.googlesyndication.com/pagead/js/adsbygoogle.js?client=ca-pub-XXXXXXXXXXXXXXXX" crossOrigin="anonymous"></script>
        <ins className="adsbygoogle"
             style={{ display: 'block' }}
             data-ad-client="ca-pub-XXXXXXXXXXXXXXXX"
             data-ad-slot="XXXXXXXXXX"
             data-ad-format="auto"
             data-full-width-responsive="true"></ins>
        <script>
            (adsbygoogle = window.adsbygoogle || []).push({});
        </script>
      </div>
    </div>
  );
}
```

4.4. Create API routes:

```js
// pages/api/articles/index.js
import dbConnect from '../../../lib/mongodb';
import Article from '../../../lib/models/Article';

export default async function handler(req, res) {
  await dbConnect();
  
  if (req.method === 'GET') {
    try {
      const { limit = 10, skip = 0, category, tag } = req.query;
      
      let query = {};
      
      if (category) {
        query.category = category;
      }
      
      if (tag) {
        query.hashtags = `#${tag}`;
      }
      
      const articles = await Article
        .find(query)
        .sort({ publishedDate: -1 })
        .skip(parseInt(skip))
        .limit(parseInt(limit));
        
      const total = await Article.countDocuments(query);
      
      res.status(200).json({ 
        articles, 
        total,
        hasMore: total > (parseInt(skip) + parseInt(limit))
      });
    } catch (error) {
      res.status(500).json({ error: error.message });
    }
  } else {
    res.setHeader('Allow', ['GET']);
    res.status(405).end(`Method ${req.method} Not Allowed`);
  }
}
```

```js
// pages/api/articles/[slug].js
import dbConnect from '../../../lib/mongodb';
import Article from '../../../lib/models/Article';

export default async function handler(req, res) {
  await dbConnect();
  
  if (req.method === 'GET') {
    try {
      const { slug } = req.query;
      
      const article = await Article.findOne({ slug });
      
      if (!article) {
        return res.status(404).json({ error: 'Article not found' });
      }
      
      // Increment view count
      article.viewCount += 1;
      await article.save();
      
      res.status(200).json(article);
    } catch (error) {
      res.status(500).json({ error: error.message });
    }
  } else {
    res.setHeader('Allow', ['GET']);
    res.status(405).end(`Method ${req.method} Not Allowed`);
  }
}
```

```js
// pages/api/tags/index.js
import dbConnect from '../../../lib/mongodb';
import Tag from '../../../lib/models/Tag';

export default async function handler(req, res) {
  await dbConnect();
  
  if (req.method === 'GET') {
    try {
      const tags = await Tag.find().sort({ count: -1 });
      
      res.status(200).json(tags);
    } catch (error) {
      res.status(500).json({ error: error.message });
    }
  } else {
    res.setHeader('Allow', ['GET']);
    res.status(405).end(`Method ${req.method} Not Allowed`);
  }
}
```

4.5. Create main page files:

```jsx
// pages/index.js
import { useState, useEffect } from 'react';
import Layout from '../components/Layout';
import ArticleCard from '../components/ArticleCard';
import TagCloud from '../components/TagCloud';
import HeaderAd from '../components/ads/
