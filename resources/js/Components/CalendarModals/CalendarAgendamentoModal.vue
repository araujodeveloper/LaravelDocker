<script setup>
import ButtonSmBlue from '../Buttons/Small/ButtonSmBlue.vue';
import ButtonSmRed from '../Buttons/Small/ButtonSmRed.vue';
import FormInput from '../FormInput.vue';
import Check from '../Icons/Check.vue';
import Trash from '../Icons/Trash.vue';
import { alertConfirmation, returnToastSuccess, returnToastError, returnToastWarning } from '@/functions-sweetalert';
import { useForm } from '@inertiajs/vue3';
import Multiselect from '@vueform/multiselect';
import timeFormat from '@/Helpers/TimeFormat';
import ButtonSmLight from '../Buttons/Small/ButtonSmLight.vue';
import Plus from '../Icons/Plus.vue';
import { ref } from 'vue';


const emit = defineEmits(['modal-toggle', 'add-evento', 'update-evento', 'delete-evento']);

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
    profissionais_options: Array,
    pacientes_options: Array,
    tipo_servicos_options: Array,
    status_agendamentos_options: Array,
    paciente: Object,
    event: Object,
    calendar: Object,
    color_status_agendamentos: Array,
    motivos_cancelamentos: Array,
    title: String,
    alter_modal: Boolean,
});

function modalToggleFunction() {
    emit('modal-toggle');
}

function addEventoFunction() {
    emit('add-evento');
}

function updateEventoFunction(evento) {
    emit('update-evento', evento);
}

function deleteEventoFunction(eventoId){
    emit('delete-evento', eventoId);
}

//  ALGORÍTMO PARA MANIPULAÇÃO DOS VALORES DE HORA DE INICIO E HORA DE FIM

let dateAndTime = props.event.startStr !== undefined ? props.event.startStr.split("T") : props.event.dateStr.split("T");
let date = dateAndTime[0];
let hour = dateAndTime[1].substr(0, 8);
let time = dateAndTime[1];
//let gmt = time.split("-");
let alter_modal_status = ref(props.alter_modal);



let form;

if (props.event.extendedProps === null || props.event.extendedProps === undefined) {
    form = useForm({
        paciente_id: null,
        profissional_id: null,
        status_agendamento_id: null,
        tipo_servico_id: null,
        start: null,
        end: null,
        all_day: false,
        title: null,
        overlap: false,
        background_color: null,
        session_time: null,
        motivo_cancelamento_id: null,
    });
} else {
    form = useForm({
        paciente_id: props.event.extendedProps.paciente_id,
        profissional_id: props.event.extendedProps.profissional_id,
        status_agendamento_id: props.event.extendedProps.status_agendamento_id,
        tipo_servico_id: props.event.extendedProps.tipo_servico_id,
        start: null,
        end: null,
        all_day: false,
        title: null,
        overlap: false,
        background_color: null,
        session_time: props.event.extendedProps.session_time,
        motivo_cancelamento_id: props.event.extendedProps.motivo_cancelamento_id,
    });
}

form.start = hour.substr(0, 5);

function handleSubmit() {

    let bgColor = props.color_status_agendamentos[form.status_agendamento_id];
    form.background_color = bgColor;

    let originalStart = form.start;
    let initSession = new Date(date + " " + form.start);

    form.start = timeFormat(initSession);
    let sessionDuration = initSession.getSeconds() + form.session_time;
    form.end = timeFormat(initSession.setSeconds(sessionDuration));

    form.title = JSON.parse(props.pacientes_options).find(option => option.value == form.paciente_id).label;

    if (props.alter_modal) {
        form.post(route('agendamentos.update', props.event.id), {
            preserveScroll: true,
            onSuccess: () => {
                returnToastSuccess('Agendamento atualizado');
                modalToggleFunction();
                updateEventoFunction(props.event.id);
            },
            onError: () => { 
                form.start = originalStart;
                returnToastError('Ocorreu um erro')},
        })
    } else {
        form.post(route('agendamentos.store'), {
            preserveScroll: true,
            onSuccess: () => {
                returnToastSuccess('Agendamento cadastrado');
                modalToggleFunction();
                addEventoFunction();
            },
            onError: () => {
                form.start = originalStart;
                returnToastError('Ocorreu um erro')},
        })
    }


}

let formDelete = useForm({
    agendamento_id: null,
});

function deleteAgendamento() {
    formDelete.agendamento_id = props.event.id;

    formDelete.put(route('agendamentos.destroy',props.event.id), {
        preserveScroll: true,
        onSuccess: () => {
            returnToastSuccess('Agendamento excluído');
            modalToggleFunction();
            deleteEventoFunction(props.event.id);
        },
        onError: () => returnToastError('Ocorreu um erro'),
    });
}

function criarOutroAgendamento(){
    form.paciente_id = null;
    form.profissional_id = null;
    form.status_agendamento_id = null;
    form.tipo_servico_id = null;
    form.end = null;
    form.all_day = false;
    form.title = null;
    form.overlap = false;
    form.background_color = null;
    form.session_time = null;

    props.alter_modal = false;

    alter_modal_status = false;

    document.getElementById("btnCriarOutroAgendamento").style.visibility = 'hidden';
}

function status_agendamentos_changed(){

    if(form.status_agendamento_id == 8){
        document.getElementById("select_motivo_cancelamento").classList.remove('hidden');
    }else{
        document.getElementById("select_motivo_cancelamento").classList.add('hidden');
        form.motivo_cancelamento_id = null;
    }
}

</script>

<style src="@vueform/multiselect/themes/default.css"></style>

<template>
    <!-- Main modal -->
    <div :id="props.id" :data-modal-target="props.id" tabindex="-1" aria-hidden="true"
        class="fixed top-0 left-0 right-0 z-50 w-full p-4 overflow-x-hidden overflow-y-auto md:inset-0 max-h-full bg-slate-950/75">
        <div class="relative w-full max-w-[70%] max-h-full mx-auto mt-10">
            <!-- Modal content -->
            <div class="relative bg-white rounded-lg shadow dark:bg-gray-700">
                <!-- Modal header -->
                <div class="flex items-start justify-between p-4 border-b rounded-t dark:border-gray-600">
                    <h3 class="text-xl font-semibold text-gray-900 dark:text-white">
                        {{ alter_modal_status === undefined || alter_modal_status === false ? 'Novo Agendamento' : 'Alterar Agendamento'
                        }}

                    </h3>
                    <button type="button" @click="modalToggleFunction"
                        class="text-gray-700 bg-transparent hover:bg-gray-200 hover:text-gray-900 rounded-lg text-sm w-8 h-8 ml-auto inline-flex justify-center items-center dark:hover:bg-gray-600 dark:hover:text-white dark:text-white"
                        :data-modal-hide="props.id">
                        <svg class="w-4 h-4" aria-hidden="true" xmlns="http://www.w3.org/2000/svg" fill="none"
                            viewBox="0 0 14 14">
                            <path stroke="currentColor" stroke-linecap="round" stroke-linejoin="round" stroke-width="2"
                                d="m1 1 6 6m0 0 6 6M7 7l6-6M7 7l-6 6" />
                        </svg>
                        <span class="sr-only">Fechar</span>
                    </button>
                </div>


                <form @submit.prevent="handleSubmit">
                    <!-- Modal body -->
                    <div class="p-6 space-y-6">

                        <div class="grid grid-cols-2 gap-10">
                            <div class="flex-1 mt-3">
                                <label for="paciente_id" class="block mb-2 text-sm text-gray-900 dark:text-white font-bold">
                                    Paciente</label>
                                <Multiselect v-model="form.paciente_id" name="paciente_id" :searchable="true"
                                    :options="JSON.parse(props.pacientes_options)" placeholder="Selecione um Paciente"
                                    id="paciente_id" />
                                <span v-if="form.errors.paciente_id" class="invalid-feedback">
                                    {{ form.errors.paciente_id }}
                                </span>
                            </div>
                            <div class="flex-1 mt-3">
                                <label for="profissional_id"
                                    class="block mb-2 text-sm text-gray-900 dark:text-white font-bold"> Profissional</label>
                                <Multiselect v-model="form.profissional_id" name="profissional_id" :searchable="true"
                                    :options="JSON.parse(props.profissionais_options)"
                                    placeholder="Selecione um Profissional" id="profissional_id" />
                                <span v-if="form.errors.profissional_id" class="invalid-feedback">
                                    {{ form.errors.profissional_id }}
                                </span>
                            </div>
                        </div>

                        <div class="grid grid-cols-2 gap-10">
                            <div class="flex-1 mt-3">
                                <label for="tipo_servico_id"
                                    class="block mb-2 text-sm text-gray-900 dark:text-white font-bold"> Tipo do
                                    Serviço</label>
                                <Multiselect v-model="form.tipo_servico_id" name="tipo_servico_id" :searchable="true"
                                    :options="JSON.parse(props.tipo_servicos_options)"
                                    placeholder="Selecione o tipo do serviço" id="tipo_servico_id" />
                                <span v-if="form.errors.tipo_servico_id" class="invalid-feedback">
                                    {{ form.errors.tipo_servico_id }}
                                </span>
                            </div>
                            <div class="flex-1 mt-3">
                                <label for="select_status_agendamento"
                                    class="block mb-2 text-sm text-gray-900 dark:text-white font-bold"> Status
                                    Agendamento</label>
                                <Multiselect v-model="form.status_agendamento_id" name="status_agendamento_id"
                                    @select="status_agendamentos_changed"
                                    :searchable="true" :options="JSON.parse(props.status_agendamentos_options)"
                                    placeholder="Selecione o status do agendamento" id="select_status_agendamento" />
                                <span v-if="form.errors.status_agendamento_id" class="invalid-feedback">
                                    {{ form.errors.status_agendamento_id }}
                                </span>
                            </div>

                            <div class="flex-1 mt-3 hidden" id="select_motivo_cancelamento">
                                <label for="motivo_cancelamento"
                                    class="block mb-2 text-sm text-gray-900 dark:text-white font-bold"> Motivo do Cancelamento</label>
                                <Multiselect v-model="form.motivo_cancelamento_id" name="motivo_cancelamento_id"
                                    @select="status_agendamentos_changed"
                                    :searchable="true" :options="JSON.parse(props.motivos_cancelamentos)"
                                    placeholder="Selecione o motivo do cancelamento" />
                                <span v-if="form.errors.motivo_cancelamento_id" class="invalid-feedback">
                                    {{ form.errors.motivo_cancelamento_id }}
                                </span>
                            </div>
                        </div>

                        <div class="grid grid-cols-2 gap-10">
                            <div class="flex-1 mt-3">
                                <FormInput class="input-bg-gray-50" v-model="form.start" :name="'start'"
                                    :label="'Início da sessão'" :placeholder="'Inicio da sessão'" :mask="'##:##'"
                                    />
                            </div>


                            <div class="flex-1 mt-3">
                                <label for="session_time"
                                    class="block mb-2 text-sm text-gray-900 dark:text-white font-bold"> Duração da
                                    Sessão</label>
                                <Multiselect v-model="form.session_time" name="session_time" id="session_time"
                                    :searchable="true" :options="[
                                        { value: 1800, label: '30 minutos' },
                                        { value: 3600, label: '1 hora' },
                                        { value: 5400, label: '1:30 horas' },
                                        { value: 7200, label: '2 horas' },
                                        { value: 10800, label: '3 horas' },
                                    ]" placeholder="Selecione a duração da sessão" />
                                <span v-if="form.errors.session_time" class="invalid-feedback">
                                    {{ form.errors.session_time }}
                                </span>
                            </div>
                        </div>

                    </div>



                    <!-- Modal footer -->

                
                    <div class="flex justify-between p-6 space-x-2 border-t border-gray-200 rounded-b dark:border-gray-600">
                        <div class="flex justify-start" id="btnCriarOutroAgendamento">
                            <ButtonSmLight :type="'button'" :label="'Cadastrar Outro Agendamento'"  :onclick="criarOutroAgendamento">
                                <Plus/>
                            </ButtonSmLight>
                        </div>
                        <div class="flex justify-end">
                            <ButtonSmRed :type="'button'" :label="'Excluir Agendamento'" :onclick="deleteAgendamento">
                                <Trash />
                            </ButtonSmRed>
                            <ButtonSmBlue :type="'submit'" :label="'Salvar Agendamento'">
                                <Check />
                            </ButtonSmBlue>
                        </div>
                    </div>

                </form>
            </div>
        </div>
    </div>
</template>