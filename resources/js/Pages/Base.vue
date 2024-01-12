<script setup>
import { Head, Link } from '@inertiajs/vue3';
import Sidebar from '@/Components/Sidebar.vue';
import Nav from '@/Components/Nav.vue';
import Footer from '@/Components/Footer.vue';
import Breadcrumbs from '@/Components/Breadcrumbs.vue';

import { onMounted } from 'vue';
import { initFlowbite } from 'flowbite';
import {theme_toggle} from '@/dark-mode'

// initialize components based on data attribute selectors
onMounted(() => {
    initFlowbite();

  // dark mode
    theme_toggle();

})

const props = defineProps({
    breadcrumbs: Array,
    title: String,
    token: String,
});

</script>

<template>
    <Head :title="title" />

    <Nav :token="token" />

    <div class="flex pt-16 overflow-hidden bg-gray-50 dark:bg-gray-900">

        <Sidebar />

        <div class="fixed inset-0 z-10 hidden bg-gray-900/50 dark:bg-gray-900/90" id="sidebarBackdrop"></div>

        <div id="main-content" class="relative w-full h-full overflow-y-auto bg-gray-50 lg:ml-64 dark:bg-gray-900 scroll-smooth">
            <main>
                <div class="grid grid-cols-1 px-4 pt-6 xl:grid-cols-3 xl:gap-4 dark:bg-gray-900 ">
                    <div class="mb-4 col-span-full xl:mb-2">
                        <Breadcrumbs :breadcrumbs="breadcrumbs" />
                        <slot name="nav"/>
                        <h1 class="text-xl font-semibold text-gray-900 sm:text-2xl dark:text-white mb-4">{{ title }}</h1>

                        <!-- Conteúdo da página  -->
                        <slot name="content"/>
                    </div>
                    
                    
                </div>
            </main>

            <Footer />

        </div>

    </div>
</template>
