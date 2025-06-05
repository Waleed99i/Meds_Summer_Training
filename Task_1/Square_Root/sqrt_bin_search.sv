module sqrt_bin_search #(parameter int MAX_ITER = 100)
(
    input  logic clk,
    input  logic rst,
    input  logic start,
    input  real  x,
    output logic done,
    output real  result
);

    real low, high, mid;
    int iter;

    typedef enum logic [1:0] { IDLE, CALC, DONE} state_t;

    state_t state;

    always_ff @(posedge clk or posedge rst) begin
        if (rst) begin
            state  <= IDLE;
            result <= 0.0;
            done   <= 0;
            iter   <= 0;
            low    <= 0.0;
            high   <= 0.0;
            mid    <= 0.0;
        end 

        else begin
            case (state)
                IDLE: begin
                    if (start) begin
                        if (x < 0.0) begin
                            result <= -1.0;  // indicate error
                            done   <= 1;
                            state  <= DONE;
                        end
                        else begin
                            low    <= 0.0;
                            high   <= (x >= 1.0) ? x : 1.0;
                            iter   <= 0;
                            done   <= 0;
                            state  <= CALC;
                        end
                    end
                end

                CALC: begin
                    mid <= (low + high) / 2.0;

                    if ((mid * mid > x))
                        high <= mid;
                    else
                        low <= mid;

                    iter <= iter + 1;

                    if ((high - low) < 1e-6 || iter >= MAX_ITER  ) begin
                        result <= mid;
                        state  <= DONE;
                    end
                end

                DONE: begin
                    done  <= 1;
                    state <= IDLE;
                end

                default: state <= IDLE;

            endcase
        end
    end
endmodule





