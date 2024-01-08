<script setup>

defineProps({
    token: String,
    action: String,
    method: String,
});

</script>

<template>

<form :action="action" :method="method">
<input type="hidden" name="_token" :value="token" />

<slot/>
</form>


</template>