<script setup>
import { onMounted } from 'vue'
import { initFlowbite } from 'flowbite'

// initialize components based on data attribute selectors
onMounted(() => {
    initFlowbite();
});
</script>

<template>
    <footer
        class="p-4 mt-32 mx-4 bottom-10  bg-white rounded-lg shadow md:flex md:items-center md:justify-between md:p-6 xl:p-8 dark:bg-gray-800">
        <ul class="flex flex-wrap items-center mb-6 space-y-1 md:mb-0">
            <li><a href="#" class="mr-4 text-sm font-normal text-gray-500 hover:underline md:mr-6 dark:text-gray-400">Terms
                    and
                    conditions</a></li>
            <li><a href="#" class="text-sm font-normal text-gray-500 hover:underline dark:text-gray-400">Contato</a>
            </li>
        </ul>
        
    </footer>

    <p class="my-10 text-sm text-center text-gray-500">
        &copy; 2023 Beizi.
    </p>
</template>