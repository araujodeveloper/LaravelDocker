<script setup>
const emit = defineEmits(['modal-toggle']);

const props = defineProps({
    titulo: {
        type: String,
        required: true
    },
    id: {
        type: String,
        required: true
    },
    toggle: Object,
});

function modalToggleFunction(){
    emit('modal-toggle');

}

</script>

<template>

<!-- Main modal -->
<div :id="props.id"  :data-modal-target="props.id" tabindex="-1" aria-hidden="true" class="fixed top-0 left-0 right-0 z-50 w-full p-4 overflow-x-hidden overflow-y-auto md:inset-0 max-h-full bg-slate-950/75">
    <div class="relative w-full max-w-[70%] max-h-full mx-auto mt-10">
        <!-- Modal content -->
        <div class="relative bg-white rounded-lg shadow dark:bg-gray-700">
            <!-- Modal header -->
            <div class="flex items-start justify-between p-4 border-b rounded-t dark:border-gray-600">
                <h3 class="text-xl font-semibold text-gray-900 dark:text-white">
                    {{ titulo }}
                </h3>
                <button type="button" @click="modalToggleFunction" class="text-gray-400 bg-transparent hover:bg-gray-200 hover:text-gray-900 rounded-lg text-sm w-8 h-8 ml-auto inline-flex justify-center items-center dark:hover:bg-gray-600 dark:hover:text-white" :data-modal-hide="props.id">
                    <svg class="w-3 h-3" aria-hidden="true" xmlns="http://www.w3.org/2000/svg" fill="none" viewBox="0 0 14 14">
                        <path stroke="currentColor" stroke-linecap="round" stroke-linejoin="round" stroke-width="2" d="m1 1 6 6m0 0 6 6M7 7l6-6M7 7l-6 6"/>
                    </svg>
                    <span class="sr-only">Fechar</span>
                </button>
            </div>
            <!-- Modal body -->
            <div class="p-6 space-y-6">
                <slot name="body"></slot>
            </div>
            <!-- Modal footer -->
            <div class="flex items-center p-6 space-x-2 border-t border-gray-200 rounded-b dark:border-gray-600">
                <slot name="footer"></slot>
            </div>
        </div>
    </div>
</div>


</template>