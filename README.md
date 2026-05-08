# 🌸 Karen's Flavor House

Plain HTML/CSS/JS recipe site hosted on GitHub Pages.
No framework. No build step. No server. Just files.

---

## Files

| File                | What it does                              |
|---------------------|-------------------------------------------|
| `index.html`        | Public recipe browser                     |
| `upload.html`       | Karen's password-protected upload page    |
| `style.css`         | All the styles                            |
| `config.js`         | YOUR Supabase keys & upload password      |
| `supabase-setup.sql`| Run once in Supabase to set up the table  |

---

## Step 1 — Supabase Setup

1. Go to [supabase.com](https://supabase.com) and open your project
   (or create a free one if you haven't yet).

2. Click **SQL Editor** in the left sidebar.

3. Paste the entire contents of `supabase-setup.sql` and click **Run**.

4. Click **Storage** in the left sidebar → **New Bucket**:
   - Name: `recipe-files`
   - Toggle **Public bucket** → ON
   - Click **Save**

5. Click into the `recipe-files` bucket → **Policies** → add two policies:
   - **SELECT** — Name: `Public downloads` — Expression: `true`
   - **INSERT** — Name: `Public uploads`   — Expression: `true`

---

## Step 2 — Fill in config.js

Open `config.js` and replace the placeholder values:

```js
const CONFIG = {
  supabaseUrl:    'https://YOUR-PROJECT-ID.supabase.co',
  supabaseKey:    'YOUR-ANON-KEY-HERE',
  uploadPassword: 'YOUR-UPLOAD-PASSWORD-HERE',
};
```

- **supabaseUrl** and **supabaseKey** come from:
  Supabase → Settings → API → Project URL and anon/public key

- **uploadPassword** is whatever Karen wants to type to reach the upload form.
  Pick anything — `GrandmasBiscuits2025!` for example.

---

## Step 3 — GitHub & GitHub Pages

1. Create a new **public** repository on GitHub
   (e.g. `karensflavorhouse`).

2. Push all files:
   ```bash
   git init
   git add .
   git commit -m "feat: initial Karen's Flavor House site"
   git branch -M main
   git remote add origin https://github.com/YOUR-USERNAME/karensflavorhouse.git
   git push -u origin main
   ```

3. On GitHub → your repo → **Settings → Pages**:
   - Source: **Deploy from a branch**
   - Branch: **main** / **(root)**
   - Click **Save**

4. GitHub will give you a URL like:
   `https://your-username.github.io/karensflavorhouse/`
   It takes about 1–2 minutes to go live.

---

## Step 4 — Connect karensflavorhouse.com

Your domain registrar (wherever you bought the domain) needs two DNS records:

| Type  | Name | Value                              |
|-------|------|------------------------------------|
| A     | @    | 185.199.108.153                    |
| A     | @    | 185.199.109.153                    |
| A     | @    | 185.199.110.153                    |
| A     | @    | 185.199.111.153                    |
| CNAME | www  | your-username.github.io            |

Then in GitHub → your repo → **Settings → Pages → Custom domain**:
- Type `karensflavorhouse.com` and click **Save**
- Check **Enforce HTTPS** once it appears (may take a few hours for DNS)

---

## How Karen Uploads a Recipe

1. Go to `https://karensflavorhouse.com/upload.html`
2. Type the upload password
3. Fill in title, category, optional description
4. Attach a PDF or photo of the recipe
5. Click **Add Recipe to Flavor House**

---

## Accepted Recipe File Formats

| Format | Best use                          |
|--------|-----------------------------------|
| PDF    | Typed or formatted recipes        |
| JPG    | Photos of handwritten recipe cards|
| PNG    | Screenshots or scans              |
| WEBP   | Compressed web images             |

Max size: **20 MB**

---

## Future Features (Placeholder in Footer)

- 🛒 Live ingredient prices (Kroger / Walmart APIs)
- 📍 Where to find specialty ingredients
- 🍳 Equipment links

---

## Categories

Breakfast · Appetizers · Soups & Stews · Sides ·
Main Dishes · Desserts · Breads & Biscuits · Drinks & Punches
