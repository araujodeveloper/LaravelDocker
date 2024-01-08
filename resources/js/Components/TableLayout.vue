<script setup>

const props = defineProps({
    headers: Array,
    body: Array,
});

</script>

<template>
    <table class="w-full text-sm text-left text-gray-500 dark:text-gray-400">
        <thead class="text-xs text-gray-700 uppercase bg-gray-50 dark:bg-gray-700 dark:text-gray-400">
            <tr class="bg-gray-200 border-b dark:bg-gray-900 dark:border-gray-700">
                <th v-for="header in headers" scope="col" class="px-6 py-3">
                    {{ header}}
                </th>
            </tr>
        </thead>
        <tbody>
            <slot name="content"/>
        </tbody>
    </table>
</template>