<template>
    <span :class="`badge ${backgroundColor}`">
      <slot></slot>
    </span>
  </template>
  
  <script>
  export default {
    props: {
      backgroundColor: {
        type: String,
        required: true,
        default: "bg-green-400" 
      }
    }
  };
  </script>
  
  <style>
  .badge {
    @apply inline-block px-2 py-1 rounded-full text-white font-semibold text-xs;
  }
  </style>
  