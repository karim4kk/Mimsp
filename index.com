<style>
    @import url('https://fonts.googleapis.com/css2?family=Roboto:wght@400;500;700&display=swap');
    body { 
        background-color: #eff6ff; 
        font-family: 'Roboto', Arial, sans-serif; 
        line-height: 1.6; 
        margin: 0; 
        font-size: 15px; 
        width: 100%; 
        box-sizing: border-box; 
        overflow-x: hidden; 
    }
    header { 
        background-color: #1e3a8a; 
        color: white; 
        position: sticky; 
        top: 0; 
        z-index: 50; 
        box-shadow: 0 2px 4px rgba(0,0,0,0.1); 
        width: 100%; 
        padding: 0.5rem 0; 
        height: 60px; 
        display: flex; 
        align-items: center; 
    }
    .container { 
        max-width: 100%; 
        padding: 0 20px; 
    }
    .post-container { 
        max-width: 640px; 
        width: 100%; 
        margin: 0 auto; 
    }
    .flex { display: flex; flex-wrap: wrap; }
    .justify-between { justify-content: space-between; }
    .items-center { align-items: center; }
    .space-x-2 > * + * { margin-left: 0.5rem; }
    .space-y-2 > * + * { margin-top: 0.5rem; }
    .bg-white { background-color: #ffffff; }
    .rounded { border-radius: 0.25rem; }
    .shadow-md { box-shadow: 0 4px 6px rgba(0,0,0,0.1); }
    .shadow-lg { box-shadow: 0 10px 15px rgba(0,0,0,0.1); }
    .p-3 { padding: 0.75rem; }
    .p-4 { padding: 1rem; }
    .mb-3 { margin-bottom: 0.75rem; }
    .mb-4 { margin-bottom: 1rem; }
    h1, h2, h3 { font-size: 15px; }
    p { font-size: 15px; }
    .header { font-size: 15px; }
    .font-bold { font-weight: 700; }
    .font-semibold { font-weight: 500; }
    .text-blue-800 { color: #1e40af; }
    .text-gray-600 { color: #4b5563; }
    .text-cyan-200 { color: #cffafe; }
    .text-white { color: #fff; }
    .hover\:text-blue-800:hover { color: #1e40af; }
    .hover\:text-cyan-200:hover { color: #cffafe; }
    .bg-blue-600 { background-color: #2563eb; }
    .hover\:bg-blue-700:hover { background-color: #1d4ed8; }
    .grid { display: grid; }
    .grid-cols-1 { grid-template-columns: 1fr; }
    .gap-4 { gap: 1rem; }
    .hidden { display: none; }
    .md\:flex { display: flex; }
    .md\:hidden { display: none; }
    img { 
        max-width: 100%; 
        height: auto; 
        border-radius: 0.25rem; 
        width: 100%; 
        object-fit: cover; 
    }
    a { text-decoration: none; }
    input[type="text"] { 
        border: 1px solid #d1d5db; 
        padding: 0.5rem; 
        border-radius: 0.25rem 0 0 0.25rem; 
        outline: none; 
        font-size: 0.9rem; 
        width: 100%; 
        box-sizing: border-box; 
    }
    button { cursor: pointer; }
    .nav-link { 
        position: relative; 
        font-size: 0.9rem; 
        transition: color 0.3s ease; 
        padding: 0 0.5rem; 
        white-space: nowrap; /* منع تقسيم الكلمات */
    }
    .nav-link::after { 
        content: ''; 
        position: absolute; 
        width: 0; 
        height: 2px; 
        bottom: -2px; 
        left: 0; 
        background-color: #cffafe; 
        transition: width 0.3s ease; 
    }
    .nav-link:hover::after { width: 100%; }
    .btn-enhanced {
        padding: 0.5rem;
        font-size: 0.9rem;
        display: inline-flex;
        align-items: center;
        gap: 0.5rem;
        background: linear-gradient(90deg, #1e40af, #2563eb);
        border: none;
        border-radius: 0.25rem;
        color: white;
        font-weight: 500;
        text-align: center;
        transition: transform 0.3s ease, box-shadow 0.3s ease, background 0.3s ease;
        animation: glow 2s ease-in-out infinite;
        width: auto;
    }
    .btn-enhanced:hover {
        transform: scale(1.05);
        box-shadow: 0 8px 16px rgba(0,0,0,0.3);
        background: linear-gradient(90deg, #2563eb, #1e40af);
    }
    .btn-enhanced:active {
        transform: scale(0.95);
    }
    @keyframes glow {
        0%, 100% { box-shadow: 0 0 10px rgba(37, 99, 235, 0.5); }
        50% { box-shadow: 0 0 20px rgba(37, 99, 235, 0.8); }
    }
    .btn-enhanced.stop-glow {
        animation: none;
    }
    footer { 
        background-color: #1e3a8a; 
        color: white; 
        padding: 2rem 0; 
        width: 100%; 
    }
    .footer-link { transition: color 0.3s ease; }
    .footer-link:hover { color: #cffafe; }
    .global-logo { border-radius: 50%; object-fit: cover; }
    aside { width: 100%; }
    @media screen and (max-width: 768px) {
        .container { 
            padding: 10px; 
        }
        .header { 
            font-size: 24px; 
            width: 100%; 
            flex-wrap: nowrap; /* منع الالتفاف */
            overflow-x: auto; /* السماح بالتمرير الأفقي إذا لزم الأمر */
            white-space: nowrap; /* منع تقسيم الكلمات */
        }
        header { 
            height: auto; /* السماح للارتفاع بالتكيف */
            min-height: 50px; 
            padding: 0.25rem 0; 
        }
        .nav-link { 
            font-size: 0.85rem; 
            padding: 0.5rem; /* زيادة padding لضمان وضوح الكلمات */
            display: inline-block; /* منع الانقسام */
        }
        nav.md\\:flex { 
            display: none; 
        }
        #mobile-menu { 
            width: 100%; 
            padding: 0.5rem; 
            box-sizing: border-box; 
        }
        #mobile-menu nav { 
            flex-direction: column; 
            align-items: flex-start; 
            padding: 0; 
        }
        #mobile-menu .nav-link { 
            width: 100%; 
            padding: 0.5rem 0; 
            border-bottom: 1px solid #4b5563; 
            white-space: nowrap; /* منع تقسيم الكلمات في القائمة */
            display: block; /* ضمان العرض الكامل */
        }
        body { font-size: 14px; }
        .p-4 { padding: 0.75rem; }
        .p-3 { padding: 0.5rem; }
        .grid { grid-template-columns: 1fr; }
        .md\:col-span-2, .md\:col-span-1 { grid-column: 1 / -1; }
        .space-x-2 > * + * { margin-left: 0.25rem; }
        .flex { flex-direction: column; align-items: flex-start; }
        .justify-between { justify-content: flex-start; }
    }
    @media (min-width: 768px) {
        .md\:grid-cols-3 { grid-template-columns: 2fr 1fr; }
        .md\:col-span-2 { grid-column: span 2; }
        .md\:col-span-1 { grid-column: span 1; }
        .md\:flex { display: flex; }
        .md\:hidden { display: none; }
        body { font-size: 16px; }
    }
</style>

<!-- Header -->
<header class="header">
    <div class="container flex justify-between items-center" style="height: 100%;">
        <div class="flex items-center gap-4">
            <img src="https://images.pexels.com/photos/4021779/pexels-photo-4021779.jpeg?auto=compress&cs=tinysrgb&w=30&h=30&fit=crop" alt="Logo Radiologues" style="width: 30px; height: 30px; border-radius: 50%;" loading="lazy">
            <h1 class="font-bold">
                <a href="/" class="text-white">Radiologues</a>
            </h1>
        </div>
        <nav class="hidden md:flex space-x-2 items-center">
            <a href="#" class="nav-link text-white hover:text-cyan-200">Accueil</a>
            <a href="https://sites.google.com/view/mimsp/les-cour" target="_blank" class="nav-link text-white hover:text-cyan-200">Matières</a>
            <a href="https://sites.google.com/view/mimsp/les-cour" target="_blank" class="nav-link text-white hover:text-cyan-200">Conseils d'Étude</a>
            <a href="https://sites.google.com/view/mimsp/%D8%B3%D9%8A%D8%A7%D8%B3%D8%A9-%D8%A7%D9%84%D8%AE%D8%B5%D9%88%D8%B5%D9%8A%D8%A9" target="_blank" class="nav-link text-white hover:text-cyan-200">Contactez-nous</a>
        </nav>
        <div class="md:hidden">
            <button id="menu-toggle" style="background: none; border: none;">
                <span style="font-size: 1.25rem; color: white;">☰</span>
            </button>
        </div>
    </div>
    <div id="mobile-menu" class="hidden md:hidden" style="background-color: #1e40af;">
        <nav class="flex flex-col space-y-2 p-3">
            <a href="#" class="nav-link text-white hover:text-cyan-200">Accueil</a>
            <a href="https://sites.google.com/view/mimsp/les-cour" target="_blank" class="nav-link text-white hover:text-cyan-200">Matières</a>
            <a href="https://sites.google.com/view/mimsp/les-cour" target="_blank" class="nav-link text-white hover:text-cyan-200">Conseils d'Étude</a>
            <a href="https://sites.google.com/view/mimsp/%D8%B3%D9%8A%D8%A7%D8%B3%D8%A9-%D8%A7%D9%84%D8%AE%D8%B5%D9%88%D8%B5%D9%8A%D8%A9" target="_blank" class="nav-link text-white hover:text-cyan-200">Contactez-nous</a>
        </nav>
    </div>
</header>

<!-- Main Content -->
<main class="container py-4">
    <section class="post-container bg-white rounded shadow-lg p-4 mb-4">
        <img src="https://images.pexels.com/photos/305568/pexels-photo-305568.jpeg?auto=compress&cs=tinysrgb&w=640" alt="Équipement de radiologie avancé" class="mb-3" loading="lazy">
        <h2 class="font-bold text-blue-800 mb-3">Plateforme Radiologues pour l'Imagerie Paramédicale</h2>
        <p class="text-gray-600 mb-3">Bienvenue chez Radiologues ! Nous proposons des cours personnalisés pour l'imagerie paramédicale, dont la moitié est dédiée aux opérateurs de radios et scanners, ainsi que des rapports de stage, exposés, et réponses à vos questions.</p>
        <p class="text-gray-600 mb-3 font-semibold">Remarque : Contactez-nous via la section 'Contactez-nous' pour un accès direct au contenu.</p>
        <ul class="space-y-2 mb-4">
            <li><a href="https://sites.google.com/view/mimsp/les-cour" target="_blank" class="text-blue-600 hover:text-blue-800">📘 Cours des trois années</a></li>
            <li><a href="https://sites.google.com/view/mimsp/les-cour" target="_blank" class="text-blue-600 hover:text-blue-800">🩺 Cours pour opérateurs d'équipements paramédicaux</a></li>
            <li><a href="https://sites.google.com/view/mimsp/les-m%C3%A9moires-de-fun-%C3%A9tudes" target="_blank" class="text-blue-600 hover:text-blue-800">📗 Mémoires de fin d'études prêts à l'emploi</a></li>
            <li><a href="https://sites.google.com/view/mimsp/les-cour" target="_blank" class="text-blue-600 hover:text-blue-800">📕 Modèles d'examens pour étudiants et professeurs</a></li>
            <li><a href="https://sites.google.com/view/mimsp/%D9%86%D9%85%D8%A7%D8%B0%D8%AC-%D8%AA%D9%82%D8%B1%D9%8A%D8%B1-%D8%A7%D9%84%D8%AA%D8%B1%D8%A8%D8%B5-rapporte-de-stage" target="_blank" class="text-blue-600 hover:text-blue-800">📝 Rapports de stage (Rapport de Stage)</a></li>
            <li><a href="https://sites.google.com/view/mimsp/%D8%A7%D9%83%D8%B3%D8%A8%D9%88%D8%B2%D9%8A%D8%A7%D8%AA-%D8%AC%D8%A7%D9%87%D8%B2%D8%A9" target="_blank" class="text-blue-600 hover:text-blue-800">📊 Créez-moi un exposé</a></li>
            <li><a href="https://sites.google.com/view/mimsp/%D8%B3%D9%8A%D8%A7%D8%B3%D8%A9-%D8%A7%D9%84%D8%AE%D8%B5%D9%88%D8%B5%D9%8A%D8%A9" target="_blank" class="text-blue-600 hover:text-blue-800">💬 Section Posez vos questions – Contactez-nous</a></li>
        </ul>
        <p class="font-semibold text-gray-600 mb-3">🌐 Pour accéder au site complet :</p>
        <a href="https://sites.google.com/view/mimsp/" target="_blank" class="btn-enhanced">
            <span>🌐 Cliquez ici pour visiter le site</span>
        </a>
    </section>

    <section class="grid grid-cols-1 md:grid-cols-3 gap-4">
        <div class="md:col-span-2">
            <h2 class="font-bold mb-4 text-blue-800">Derniers Articles</h2>
            <div class="post-container bg-white rounded shadow-md mb-4 p-3">
                <img src="https://images.pexels.com/photos/4021817/pexels-photo-4021817.jpeg?auto=compress&cs=tinysrgb&w=640" alt="Scanner médical de haute précision" class="mb-3" loading="lazy">
                <h3 class="font-semibold mb-2 text-blue-800">Comment utiliser les équipements d'imagerie radiologique</h3>
                <div class="text-gray-600">
                    <p>Découvrez les meilleures pratiques pour utiliser les appareils de radio et de scanner avec efficacité et sécurité.</p>
                    <p class="mt-2">Commencez par vérifier l'équipement pour s'assurer qu'il est exempt de défauts, et suivez les consignes de sécurité comme le port de protections contre الإشعاعات.</p>
                    <p class="mt-2">Astuce : Guidez المريض بدقة للحصول على صور واضحة وتأكدوا من جودة الصورة قبل إنهاء الفحص.</p>
                    <p class="mt-2">استخدموا برامج معالجة الصور لضبط السطوع والتباين، وتأكدوا من صيانة الجهاز بانتظام.</p>
                </div>
            </div>
            <div class="post-container bg-white rounded shadow-md mb-4 p-3">
                <img src="https://images.pexels.com/photos/4021775/pexels-photo-4021775.jpeg?auto=compress&cs=tinysrgb&w=640" alt="Analyse d'images radiologiques" class="mb-3" loading="lazy">
                <h3 class="font-semibold mb-2 text-blue-800">Rédaction de rapports de stage en imagerie paramédicale</h3>
                <div class="text-gray-600">
                    <p>Guide complet pour كتابة تقارير الممارسة المهنية بجودة عالية.</p>
                    <p class="mt-2">ابدأ بمقدمة توضح أهداف التدريب والمؤسسة، ثم سجل المهام اليومية مثل استخدام الماسحات أو تحليل الصور.</p>
                    <p class="mt-2">أضف قسمًا عن التحديات وكيفية التغلب عليها مع اقتراحات لتحسين التدريب.</p>
                    <p class="mt-2">لتقرير احترافي، أدرج ملحقًا بأمثلة للصور مع حماية بيانات المرضى، واستخدم تنسيقًا موحدًا.</p>
                </div>
            </div>
        </div>
        <aside class="md:col-span-1">
            <div class="bg-white rounded shadow-md p-3 mb-4">
                <h3 class="font-semibold text-blue-800 mb-3">Rechercher dans Radiologues</h3>
                <div class="flex">
                    <input type="text" placeholder="Rechercher..." class="w-full p-2 border rounded-r" style="outline: none;">
                    <button style="background-color: #2563eb; color: white; padding: 0.5rem; border-radius: 0 0.25rem 0.25rem 0;">🔍</button>
                </div>
            </div>
            <div class="bg-white rounded shadow-md p-3">
                <h3 class="font-semibold text-blue-800 mb-3">Catégories</h3>
                <ul class="space-y-2">
                    <li><a href="#" class="text-blue-600 hover:text-blue-800">Imagerie Radiologique</a></li>
                    <li><a href="#" class="text-blue-600 hover:text-blue-800">Techniques de Scanner</a></li>
                    <li><a href="#" class="text-blue-600 hover:text-blue-800">Conseils d'étude</a></li>
                </ul>
            </div>
        </aside>
    </section>
</main>

<footer class="container">
    <div class="grid grid-cols-1 md:grid-cols-3 gap-4">
        <div>
            <h3 class="font-semibold mb-3">À propos de Radiologues</h3>
            <p class="text-cyan-200">Radiologues est une plateforme éducative dédiée à l'imagerie paramédicale, offrant des cours, rapports de stage, et exposés.</p>
        </div>
        <div>
            <h3 class="font-semibold mb-3">Liens rapides</h3>
            <ul class="space-y-2">
                <li><a href="https://sites.google.com/view/mimsp/les-cour" target="_blank" class="footer-link text-cyan-200">Matières</a></li>
                <li><a href="https://sites.google.com/view/mimsp/les-cour" target="_blank" class="footer-link text-cyan-200">Conseils d'Étude</a></li>
                <li><a href="https://sites.google.com/view/mimsp/%D8%B3%D9%8A%D8%A7%D8%B3%D8%A9-%D8%A7%D9%84%D8%AE%D8%B5%D9%88%D8%B5%D9%8A%D8%A9" target="_blank" class="footer-link text-cyan-200">Contactez-nous</a></li>
            </ul>
        </div>
        <div>
            <h3 class="font-semibold mb-3">Contactez-nous</h3>
            <p class="text-cyan-200"><a href="mailto:karimoofficiel076@gmail.com" class="footer-link">Email: karimoofficiel076@gmail.com</a></p>
            <div class="flex space-x-2 mt-3">
                <a href="#" class="text-cyan-200 hover:text-white">📘</a>
                <a href="#" class="text-cyan-200 hover:text-white">🐦</a>
                <a href="#" class="text-cyan-200 hover:text-white">📷</a>
            </div>
        </div>
    </div>
    <div style="margin-top: 1rem;">
        <h3 class="font-semibold mb-3 text-center">Rechercher sur le site</h3>
        <form action="https://www.google.com/search" method="get" class="flex justify-center">
            <input type="hidden" name="sitesearch" value="YOUR_BLOGGER_URL">
            <input type="text" name="q" placeholder="Rechercher..." class="w-3/4 md:w-1/2 p-2 border rounded-l">
            <button type="submit" style="background-color: #2563eb; color: white; padding: 0.5rem 1rem; border-radius: 0 0.25rem 0.25rem 0;">🔍</button>
        </form>
    </div>
    <div style="margin-top: 1rem;">
        <h3 class="font-semibold mb-3 text-center">Empreintes Mondiales</h3>
        <div class="flex flex-wrap justify-center gap-4">
            <div class="text-center">
                <img src="https://images.pexels.com/photos/4021815/pexels-photo-4021815.jpeg?auto=compress&cs=tinysrgb&w=50&h=50&fit=crop" alt="Partenariat médical mondial" class="global-logo" style="width: 50px; height: 50px; margin: 0 auto;" loading="lazy">
                <p class="text-cyan-200 mt-2">Partenariat avec un réseau médical mondial</p>
            </div>
            <div class="text-center">
                <img src="https://images.pexels.com/photos/4021813/pexels-photo-4021813.jpeg?auto=compress&cs=tinysrgb&w=50&h=50&fit=crop" alt="Accréditation organisation médicale" class="global-logo" style="width: 50px; height: 50px; margin: 0 auto;" loading="lazy">
                <p class="text-cyan-200 mt-2">Accréditation par une organisation médicale</p>
            </div>
        </div>
    </div>
    <div class="mt-4 text-center text-cyan-200">
        © 2025 Radiologues. Tous droits réservés.
    </div>
</footer>

<script>
    document.getElementById('menu-toggle').addEventListener('click', () => {
        document.getElementById('mobile-menu').classList.toggle('hidden');
    });
    setTimeout(() => {
        document.querySelector('.btn-enhanced').classList.add('stop-glow');
    }, 5000);
</script>
